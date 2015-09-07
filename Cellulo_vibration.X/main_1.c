/* Firmware version. Increment at every major change */
/*
History:
0: Fist versioned release
*/
#define FW_VERSION 1

/* Firmware variant. Each variant of the firmware has it own number */

/*
Variant list:
0: Standard one

*/
#define FW_VARIANT 0


#include <p33fxxxx.h>

_FWDT(FWDTEN_OFF);              // Watchdog Timer disabled
_FOSCSEL(FNOSC_FRCPLL); // override oscillator configuration bits
_FOSC(POSCMD_NONE & OSCIOFNC_ON & FCKSM_CSECMD);
// ICD communicates on PGC1/EMUC1 and disable JTAG
_FICD(ICS_PGD1 & JTAGEN_OFF);

#include <can/can.h>
#include <dma/dma.h>
#include <gpio/gpio.h>
#include <clock/clock.h>
#include <error/error.h>
#include <types/types.h>
#include <timer/timer.h>
#include <vm/natives.h>
#include <vm/vm.h>
#include <common/consts.h>
#include <adc/adc.h>
#include <pwm/pwm.h>
#include <encoder/encoder.h>
#include <motor-csp/motor-csp.h>
#include <i2c/i2c.h>
#include <ic/ic.h>

#include <lis331.h>

#include <skel.h>

_FUID0(0x00);
_FUID1(0x00);
_FUID2(0x00);
#if NODE_SUFFIX == Leg1		// Defined in skel-user.h
_FUID3(0x01);
#else
_FUID3(0x02);
#endif

static unsigned int __attribute((space(dma))) motor_raw[16];

static motor_csp_data m0_pid;
static motor_csp_data m1_pid;
static motor_csp_data m2_pid;

#define m0_PWM PWM_1
#define m1_PWM PWM_2
#define m2_PWM PWM_3

// Timer 1: encoder
#define m0_PID_TIMER TIMER_2
#define m1_PID_TIMER TIMER_3
// Timer 4: encoder
#define m2_PID_TIMER TIMER_5
#define IR_PERIOD TIMER_6
#define IR_PULSE TIMER_7
// Timer 8,9: accelerometer

#define DMA_ADC1 DMA_CHANNEL_2
#define DMA_ADC2 DMA_CHANNEL_3

#define PRIO_ENCODER 6
#define PRIO_PID 5
#define PRIO_IR 4
#define PRIO_I2C 2

#define LED0 GPIO_MAKE_ID(GPIO_PORTD,0)
#define LED1 GPIO_MAKE_ID(GPIO_PORTD,1)
#define LED2 GPIO_MAKE_ID(GPIO_PORTD,2)
#define LED3 GPIO_MAKE_ID(GPIO_PORTD,3)

#define KEYPRESSED GPIO_MAKE_ID(GPIO_PORTD, 11)

#define POWERON GPIO_MAKE_ID(GPIO_PORTB, 15)
#define HALL_DIG0 GPIO_MAKE_ID(GPIO_PORTG,7)
#define HALL_DIG1 GPIO_MAKE_ID(GPIO_PORTG, 8)
#define HALL_DIG2 GPIO_MAKE_ID(GPIO_PORTG, 9)

#define IR_CTRL0	GPIO_MAKE_ID(GPIO_PORTF,4)
#define IR_CTRL1	GPIO_MAKE_ID(GPIO_PORTF,5)
#define IR_CTRL2	GPIO_MAKE_ID(GPIO_PORTG,6)



// Rsens = 0.020 Ohm
// 1 mA -> 4096 / 3.3[V] * 0.001[A] * Rsens [Ohm] * 5.15 {Gv_aop}
// ma = raw * 7.82 ~= raw * 8
// abs(+/-max) < INT((2^(16-1)-1)/8) = 4095
#define RAW_TO_MA_0_020_OHM(raw)	\
 	if(raw > 4095)					\
		raw = 4095;					\
	if(raw < -4095)					\
		raw = -4095;				\
	return (raw * 8);

// raw = mA * 0.128 ~= mA / 8 = mA * 0.125
// abs(+/-max) < INT((2^(16-1)-1)/1) = 32767
#define MA_TO_RAW_0_020_OHM(ma)		\
	if(ma > 32767)					\
		ma = 32767;					\
	if(ma < -32767)					\
		ma = -32767;				\
	return (ma / 8);

// Rsens = 0.02 Ohm
static int m0_raw_to_ma(int raw) {
	RAW_TO_MA_0_020_OHM(raw)
}

static int m0_ma_to_raw(int ma) {
	MA_TO_RAW_0_020_OHM(ma)
}

void m0_update_cb(void) {
	encoder_step(ENCODER_TYPE_HARD);
	SET_EVENT(EVENT_MOTOR_M0);
}

static int m0_pulse_to_position(long *pulse) {
	// TODO
	return *pulse;
}

static long m0_position_to_pulse(int position) {
	// TODO
	return position;
}

static int m0_pulse_to_speed(int pulse) {
	// TODO
	return pulse;
}

static int m0_speed_to_pulse(int speed) {
	// TODO
	return speed;
}

void m0_overcurrent_cb(int s) {
	if(s == MOTOR_CSP_OVERCURRENT_ACTIVE)
		SET_EVENT(EVENT_M0_OVERCURRENT);
	else
		SET_EVENT(EVENT_M0_OVERCURRENT_CLEARED);
}

void m0_timer_cb(int timer_id) {
	int i;
	vmVariables.m0_raw_current = 0;
	for(i = 0; i < 16; i+= 4)
		vmVariables.m0_raw_current -= motor_raw[i];
	vmVariables.m0_raw_current /= 4;
	vmVariables.m0_raw_current -= settings.m0_raw_current_offset;
	
	if(vmVariables.m0_pid_period > 0) {
		MOTOR_ONE_STEP(m0)
	} else {
		encoder_step(ENCODER_TYPE_HARD);
		SET_EVENT(EVENT_MOTOR_M0);
	}
}

static int m1_raw_to_ma(int raw) {
	RAW_TO_MA_0_020_OHM(raw)
}

static int m1_ma_to_raw(int ma) {
	MA_TO_RAW_0_020_OHM(ma)
}

void m1_update_cb(void) {
	encoder_step(ENCODER_TIMER_4);
	SET_EVENT(EVENT_MOTOR_M1);
}

static int m1_pulse_to_position(long *pulse) {
	return *pulse;
}

static long m1_position_to_pulse(int position) {
	return position;
}

static int m1_pulse_to_speed(int pulse) {
	return pulse;
}	

static int m1_speed_to_pulse(int speed) {
	return speed;
}

void m1_overcurrent_cb(int s) {
	if(s == MOTOR_CSP_OVERCURRENT_ACTIVE)
		SET_EVENT(EVENT_M1_OVERCURRENT);
	else
		SET_EVENT(EVENT_M1_OVERCURRENT_CLEARED);
}

void m1_timer_cb(int timer_id) {
	int i;
	vmVariables.m1_raw_current = 0;
	for(i = 1; i < 16; i+= 4)
		vmVariables.m1_raw_current -= motor_raw[i];
	vmVariables.m1_raw_current /= 4;
	vmVariables.m1_raw_current -= settings.m1_raw_current_offset;
	
	if(vmVariables.m1_pid_period > 0) {
		MOTOR_ONE_STEP(m1)
	} else {
		encoder_step(ENCODER_TIMER_4);
		SET_EVENT(EVENT_MOTOR_M1);
	}
}

static int m2_raw_to_ma(int raw) {
	RAW_TO_MA_0_020_OHM(raw)
}

static int m2_ma_to_raw(int ma) {
	MA_TO_RAW_0_020_OHM(ma)
}

void m2_update_cb(void) {
	encoder_step(ENCODER_TIMER_1);
	SET_EVENT(EVENT_MOTOR_M2);
}

static int m2_pulse_to_position(long *pulse) {
	return *pulse;
}

static long m2_position_to_pulse(int position) {
	return position;
}

static int m2_pulse_to_speed(int pulse) {
	return pulse;
}	

static int m2_speed_to_pulse(int speed) {
	return speed;
}

void m2_overcurrent_cb(int s) {
	if(s == MOTOR_CSP_OVERCURRENT_ACTIVE)
		SET_EVENT(EVENT_M2_OVERCURRENT);
	else
		SET_EVENT(EVENT_M2_OVERCURRENT_CLEARED);
}

void m2_timer_cb(int timer_id) {
	int i;
	vmVariables.m2_raw_current = 0;
	for(i = 2; i < 16; i+= 4)
		vmVariables.m2_raw_current -= motor_raw[i];
	vmVariables.m2_raw_current /= 4;
	vmVariables.m2_raw_current -= settings.m2_raw_current_offset;
	
	if(vmVariables.m2_pid_period > 0) {
		MOTOR_ONE_STEP(m2)
	} else {
		encoder_step(ENCODER_TIMER_1);
		SET_EVENT(EVENT_MOTOR_M2);
	}
}


static void acc_cb(int x, int y, int z) {
	SET_EVENT(EVENT_ACC);
	
	vmVariables.acc[0] = x;
	vmVariables.acc[1] = y;
	vmVariables.acc[2] = z;
}

AsebaNativeFunctionDescription AsebaNativeDescription_lis331_set_mode = {
	"acc.set_mode",
	"Set the accelerometer mode",
	{
		
		{1, "hz"},
		{1, "g"},
		{0,0}
	}
};

void AsebaNative_lis331_set_mode(AsebaVMState * vm) {
	int hz = vm->variables[AsebaNativePopArg(vm)];
	int g = vm->variables[AsebaNativePopArg(vm)];
	
	switch (hz) {
	case 0:
		hz = LIS331_0HZ;
		break;
	case 1:
		hz = LIS331_0_5HZ;
		break;
	case 2:
		hz = LIS331_1HZ;
		break;
	case 3:
		hz = LIS331_2HZ;
		break;
	case 4:
		hz = LIS331_5HZ;
		break;
	case 5:
		hz = LIS331_10HZ;
		break;
	case 6:
		hz = LIS331_50HZ;
		break;
	case 7:
		hz = LIS331_100HZ;
		break;
	case 8:
		hz = LIS331_400HZ;
		break;
	case 9:
		hz = LIS331_1000HZ;
		break;
	default:
		AsebaVMEmitNodeSpecificError(vm, "Invalid hz");
		return;
	}
	
	switch (g) {
	case 0:
		g = LIS331_2G;
		break;
	case 1:
		g = LIS331_4G;
		break;
	case 2:
		g = LIS331_8G;
		break;
	default:
		AsebaVMEmitNodeSpecificError(vm, "Invalid g");
		return;
	}	
	
	lis331_set_mode(hz, g);
}	

static int ir_state;
#define STATE_IR0 0
#define STATE_HALL0 1 
#define STATE_IR1 2
#define STATE_HALL1 3
#define STATE_IR2 4
#define STATE_HALL2 5

#define A_IR0 	8
#define A_IR1 	9
#define A_IR2 	10
#define A_HALL0 11
#define A_HALL1	12
#define A_HALL2	13

static int adc_channel;

static void timer_pulse_cb(int timer_id) {
	timer_disable(timer_id);
	adc2_start_simple_conversion(adc_channel);
}

static void adc_cb(int channel, int value) {
	switch(ir_state) {
		case STATE_IR0:
			vmVariables.ir_ambiant[0] = value;
			adc2_start_simple_conversion(A_HALL0);
			ir_state = STATE_HALL0;
			adc_channel = A_IR0;
			timer_set_value(IR_PULSE, 0);
			gpio_write(IR_CTRL0, 1);
			timer_enable(IR_PULSE);
			break;
		case STATE_HALL0:
			if(channel == A_HALL0)
				vmVariables.hall_analog[0] = value;
			else {
				gpio_write(IR_CTRL0,0);
				vmVariables.ir_reflected[0] = value;
				vmVariables.ir_delta[0] = vmVariables.ir_reflected[0] - vmVariables.ir_ambiant[0];
				ir_state = STATE_IR1;
				adc2_start_simple_conversion(A_IR1);
			}			
			break;
		case STATE_IR1:
			vmVariables.ir_ambiant[1]= value;
			adc2_start_simple_conversion(A_HALL1);
			ir_state = STATE_HALL1;
			adc_channel = A_IR1;
			timer_set_value(IR_PULSE, 0);
			gpio_write(IR_CTRL1, 1);
			timer_enable(IR_PULSE);
			break;
		case STATE_HALL1:
			if(channel == A_HALL1)
				vmVariables.hall_analog[1] = value;
			else {
				gpio_write(IR_CTRL1, 0);
				vmVariables.ir_reflected[1] = value;
				vmVariables.ir_delta[1] = vmVariables.ir_reflected[1] - vmVariables.ir_ambiant[1];
				ir_state = STATE_IR2;
				adc2_start_simple_conversion(A_IR2);
			}
			break;
		case STATE_IR2:
			vmVariables.ir_ambiant[2] = value;
			adc2_start_simple_conversion(A_HALL2);
			ir_state = STATE_HALL2;
			adc_channel = A_IR2;
			timer_set_value(IR_PULSE, 0);
			gpio_write(IR_CTRL2, 1);
			timer_enable(IR_PULSE);
			break;
		case STATE_HALL2:
			if(channel == A_HALL2)
				vmVariables.hall_analog[2] = value;	
			else {
				gpio_write(IR_CTRL2, 0);
				vmVariables.ir_reflected[2] = value;
				vmVariables.ir_delta[2] = vmVariables.ir_reflected[2] - vmVariables.ir_ambiant[2];
				ir_state = STATE_IR0;
				// Don't restart automatically ... .
				SET_EVENT(EVENT_SENSORS);
			}
			break;
	}
}

static void timer_period_cb(int timer_id) {
	ir_state = STATE_IR0;
	adc2_start_simple_conversion(A_IR0);
}

AsebaNativeFunctionDescription AsebaNativeDescription_motor_set_break_mode = {
	"motor.set_break_mode",
	"Set the motor break mode",
	{
		
		{1, "id of the motor [0..2]"},
		{1, "0 = disabled, 1 = enabled"},
		{0,0}
	}
};

void AsebaNative_motor_set_break_mode(AsebaVMState * vm) {
	int motor = vm->variables[AsebaNativePopArg(vm)];
	int enabled = vm->variables[AsebaNativePopArg(vm)];
	switch (motor)
	{
		case 0 :
			switch (enabled)
			{
				case 1 :
					pwm_set_brake(PWM_1, PWM_ONE_DEFAULT_LOW);
					break;
				case 0 :		
					pwm_set_brake(PWM_1, PWM_ONE_DEFAULT_HIGH);
					break;
				default :
					break;
			}
			break;
		case 1 :
			switch (enabled)
			{
				case 1 :
					pwm_set_brake(PWM_2, PWM_ONE_DEFAULT_LOW);
					break;
				case 0 :		
					pwm_set_brake(PWM_2, PWM_ONE_DEFAULT_HIGH);
					break;
				default :
					break;
			}
			break;
		case 2 :
			switch (enabled)
			{
				case 1 :
					pwm_set_brake(PWM_3, PWM_ONE_DEFAULT_LOW);
					break;
				case 0 :		
					pwm_set_brake(PWM_3, PWM_ONE_DEFAULT_HIGH);
					break;
				default :
					break;
			}
			break;
		default :
			break;
	}
}

// Native functions for battery.
static int battery_present;

AsebaNativeFunctionDescription AsebaNativeDescription_battery_update_temperature = {
	"battery.update.temperature",
	"Update the battery temperature status",
	{
		{0,0}
	}
};

void AsebaNative_battery_update_temperature(AsebaVMState * vm) {
	if(!battery_present)
		return;
	//Hack
	int t = T8CONbits.TON;
	T8CONbits.TON = 0;
	
	while(i2c_master_is_busy(I2C_1));
	
	vmVariables.battery_temperature = ds2777_read_temperature();
	
	// hack
	T8CONbits.TON = t;
}

AsebaNativeFunctionDescription AsebaNativeDescription_battery_update_voltage = {
	"battery.update.voltage",
	"Update the battery voltage status",
	{
		{0,0}
	}
};

void AsebaNative_battery_update_voltage(AsebaVMState * vm) {
	if(!battery_present)
		return;
	//Hack
	int t = T8CONbits.TON;
	T8CONbits.TON = 0;
	
	while(i2c_master_is_busy(I2C_1));
	
	vmVariables.battery_voltage = ds2777_read_global_voltage();
	
	// hack
	T8CONbits.TON = t;
}

void update_aseba_variables_read(void) {
	MOTOR_ASEBA_READ(m0)
	MOTOR_ASEBA_READ(m1)
	MOTOR_ASEBA_READ(m2)
	
	vmVariables.m0_current = m0_raw_to_ma(vmVariables.m0_raw_current);
	vmVariables.m1_current = m1_raw_to_ma(vmVariables.m1_raw_current);
	vmVariables.m2_current = m2_raw_to_ma(vmVariables.m2_raw_current);
	
	vmVariables.user_switch = !gpio_read(KEYPRESSED);
	
	vmVariables.hall_d[0] = gpio_read(HALL_DIG0);
	vmVariables.hall_d[1] = gpio_read(HALL_DIG1);
	vmVariables.hall_d[2] = gpio_read(HALL_DIG2);
}


void update_aseba_variables_write(void) {
	static int old_period;
	
	MOTOR_ASEBA_WRITE(m0)
	MOTOR_ASEBA_WRITE(m1)
	MOTOR_ASEBA_WRITE(m2)
	
	gpio_write(LED0, !!vmVariables.led[0]);
	gpio_write(LED1, !!vmVariables.led[1]);
	gpio_write(LED2, !!vmVariables.led[2]);
	gpio_write(LED3, !!vmVariables.led[3]);
	
	if(vmVariables.period != old_period) {
		old_period = vmVariables.period;
		if(old_period) {
			int temp = abs(old_period);
			if(temp > 400)
				temp = 400;
			timer_disable(IR_PERIOD);
			timer_set_period(IR_PERIOD, temp, 3);
			timer_enable(IR_PERIOD);
		} else {
			timer_disable(IR_PERIOD);
		}	
	}
}


int main(void) {
	
	int i;
	
	clock_init_internal_rc_40();
	
	gpio_write(POWERON, 1);
	gpio_set_dir(POWERON, GPIO_OUTPUT);
	
	gpio_write(LED0, 0);
	gpio_write(LED1, 0);
	gpio_write(LED2, 0);
	gpio_write(LED3, 0);
	gpio_set_dir(LED0, GPIO_OUTPUT);
	gpio_set_dir(LED1, GPIO_OUTPUT);
	gpio_set_dir(LED2, GPIO_OUTPUT);
	gpio_set_dir(LED3, GPIO_OUTPUT);
	
	gpio_write(IR_CTRL0, 0);
	gpio_write(IR_CTRL1, 0);
	gpio_write(IR_CTRL2, 0);
	gpio_set_dir(IR_CTRL0, GPIO_OUTPUT);
	gpio_set_dir(IR_CTRL1, GPIO_OUTPUT);
	gpio_set_dir(IR_CTRL2, GPIO_OUTPUT);
	
	gpio_write(LED0, 1);
	gpio_write(LED1, 1);
	gpio_write(LED2, 1);
	gpio_write(LED3, 1);

	// Wait about 1 s before really starting. The Bluetooth chip need a LOT of time before 
	// having stable output (else we recieve "Phantom" character on uart)
	// This feature could be help to measure the clock characteristic
	
	for(i = 0; i < 1000; i++) 
		clock_delay_us(1000);
	
	gpio_write(LED0, 0);
	gpio_write(LED1, 0);
	gpio_write(LED2, 0);
	gpio_write(LED3, 0);
	
	adc2_init_simple(adc_cb, PRIO_IR, 0b11111100000000,31);
	
	adc1_init_scan_dma(0b1111, ADC_START_CONVERSION_FROM_INTERNAL_COUNTER, 2, 
					DMA_ADC1, motor_raw, 0, 16, ADC_DMA_CONVERSION_ORDER, NULL);
	
	
	timer_init(m0_PID_TIMER, 10,3);
	timer_enable_interrupt(m0_PID_TIMER, m0_timer_cb, PRIO_PID);
	
	timer_init(m1_PID_TIMER, 10,3);
	timer_enable_interrupt(m1_PID_TIMER, m1_timer_cb, PRIO_PID);
	
	timer_init(m2_PID_TIMER, 10,3);
	timer_enable_interrupt(m2_PID_TIMER, m2_timer_cb, PRIO_PID);
	
	encoder_init(ENCODER_TYPE_HARD, 0, (long *) vmVariables.m0_position, (int *) &vmVariables.m0_speed_read, ENCODER_DIR_NORMAL,
		GPIO_MAKE_ID(GPIO_NONE,0), GPIO_MAKE_ID(GPIO_NONE,0), ENCODER_MODE_X4, PRIO_ENCODER);

	encoder_init(ENCODER_TIMER_4, IC_5, (long *) vmVariables.m1_position, (int *) &vmVariables.m1_speed_read, ENCODER_DIR_NORMAL,
		GPIO_MAKE_ID(GPIO_PORTD,4), GPIO_MAKE_ID(GPIO_PORTB,14), ENCODER_MODE_X4, 6);
		
	encoder_init(ENCODER_TIMER_1, IC_6, (long *) vmVariables.m2_position, (int *) &vmVariables.m2_speed_read, ENCODER_DIR_NORMAL,
		GPIO_MAKE_ID(GPIO_PORTD,5), GPIO_MAKE_ID(GPIO_NONE,0), ENCODER_MODE_X4, 6);
			
	pwm_init(PWM_PRESCALER_1, 700, PWM_CONTINUOUS_UP_DOWN);
	
	i2c_init(I2C_1);
	i2c_init_master(I2C_1, 400000, PRIO_I2C);
	
	lis331_init(I2C_1, 0x18, TIMER_89, 1, acc_cb);
	
	MOTOR_INIT(m0)
	
	MOTOR_INIT(m1)
	
	MOTOR_INIT(m2)
	
	
	timer_init(IR_PULSE, 300, 6); // 300 uS
	timer_enable_interrupt(IR_PULSE, timer_pulse_cb, PRIO_IR);
	timer_init(IR_PERIOD, 100,3); // DOn't care about the timout
	timer_enable_interrupt(IR_PERIOD, timer_period_cb, PRIO_IR);
	
	init_aseba_and_can();
	
	if(ds2777_init(I2C_1, 0x59)) {
		battery_present = 1;
		ds2777_read_romid((int *) vmVariables.battery_id);
		vmVariables.battery_voltage = ds2777_read_global_voltage();
		vmVariables.battery_temperature = ds2777_read_temperature();
	} else
		battery_present = 0;
	
	if(!load_settings_from_flash()) {
		MOTOR_LOAD_CONF(m0)
		MOTOR_LOAD_CONF(m1)
		MOTOR_LOAD_CONF(m2)
	}
	
	vmVariables.fwversion[0] = FW_VERSION;
	vmVariables.fwversion[1] = FW_VARIANT;
	
	run_aseba_main_loop();
}
