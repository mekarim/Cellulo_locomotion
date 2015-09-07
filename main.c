/* 
 * Firmware variant. Each variant of the firmware has it own number
 * Firmware version. Increment at every major change.
 * 
*/
#define FW_VERSION 1 //First release version
#define FW_VARIANT 0 // Standard one

/*
 * Preparing the microcontroller
 * Watchdog Timer disabled
 * Override oscillator configuration bits
 * ICD communicates on PGC1/EMUC1 and disable JTAG
 */
#include <p33fxxxx.h>
_FWDT(FWDTEN_OFF);
_FOSCSEL(FNOSC_FRCPLL);
_FOSC(POSCMD_NONE & OSCIOFNC_ON & FCKSM_CSECMD);
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

/* Link with ASEBA */
#include <skel.h>

_FUID0(0x00);
_FUID1(0x00);
_FUID2(0x00);

/* Defined in skel-user.h */
#if NODE_NAME == Foot1		
_FUID3(0x03);
#else
_FUID3(0x04);
#endif

static unsigned int __attribute((space(dma))) motor_raw[16];

static motor_csp_data   m0_pid;
static motor_csp_data   m1_pid;
static motor_csp_data   m2_pid;

#define m0_PWM  PWM_1
#define m1_PWM  PWM_2
#define m2_PWM  PWM_3

// Timer 1 and 4: free; accelerometer (timer 8,9))
#define TIME_TIMER      TIMER_1

#define m0_PID_TIMER    TIMER_2
#define m1_PID_TIMER    TIMER_3
#define m2_PID_TIMER    TIMER_5

#define IR_PERIOD       TIMER_6
#define IR_PULSE        TIMER_7

#define DMA_ADC1    DMA_CHANNEL_2
#define DMA_ADC2    DMA_CHANNEL_3

#define PRIO_I2C        2
#define PRIO_TIME       3
#define PRIO_IR         4
#define PRIO_PID        5
#define PRIO_ENCODER    6

#define LED0        GPIO_MAKE_ID(GPIO_PORTD,0)
#define LED1        GPIO_MAKE_ID(GPIO_PORTD,1)
#define LED2        GPIO_MAKE_ID(GPIO_PORTD,2)
#define LED3        GPIO_MAKE_ID(GPIO_PORTD,3)

#define KEYPRESSED  GPIO_MAKE_ID(GPIO_PORTD, 11)
#define POWERON     GPIO_MAKE_ID(GPIO_PORTB, 15)

#define HALL_DIG0   GPIO_MAKE_ID(GPIO_PORTG,7)
#define HALL_DIG1   GPIO_MAKE_ID(GPIO_PORTG, 8)
#define HALL_DIG2   GPIO_MAKE_ID(GPIO_PORTG, 9)

#define IR_CTRL0	GPIO_MAKE_ID(GPIO_PORTF,4)
#define IR_CTRL1	GPIO_MAKE_ID(GPIO_PORTF,5)
#define IR_CTRL2	GPIO_MAKE_ID(GPIO_PORTG,6)

// Rsens = 0.33 Ohm
// 1 mA -> 4096 / 3.3[V] * 0.001[A] * Rsens [Ohm] * 5.15 {Gv_aop}
// ma = raw * 0.474 ~= (raw * 7)/15 = raw * 0.467
// abs(+/-max) < INT((2^(16-1)-1)/7) = 4681
#define RAW_TO_MA_0_33_OHM(raw)		\
 	if(raw > 4681)					\
		raw = 4681;                 \
	if(raw < -4681)					\
		raw = -4681;				\
	return ((raw * 7) / 15);

// raw = ma * 2.109 ~= ma + (ma * 10)/9 == ma * 2.11
// abs(+/-max) < INT((2^(16-1)-1)/10) = 3276
#define MA_TO_RAW_0_33_OHM(raw)		\
	if(ma > 3276)					\
		ma = 3276;					\
	if(ma < -3276)					\
		ma = -3276;                 \
	return (ma + (ma * 10) / 9);

/** Motor 0 configuration */
static int m0_raw_to_ma(int raw) {
	RAW_TO_MA_0_33_OHM(raw)
}

static int m0_ma_to_raw(int ma) {
	MA_TO_RAW_0_33_OHM(raw)
}

void m0_update_cb(void) {
	SET_EVENT(EVENT_MOTOR_M0);
}

static int m0_pulse_to_position(long *pulse) {
	return *pulse;
}

static long m0_position_to_pulse(int position) {
	return position;
}

static int m0_pulse_to_speed(int pulse) {
	return pulse;
}

static int m0_speed_to_pulse(int speed) {
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
		SET_EVENT(EVENT_MOTOR_M0);
	}
}

/** Motor 1 configuration */
static int m1_raw_to_ma(int raw) {
	RAW_TO_MA_0_33_OHM(raw)
}

static int m1_ma_to_raw(int ma) {
	MA_TO_RAW_0_33_OHM(raw)
}

void m1_update_cb(void) {
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
		SET_EVENT(EVENT_MOTOR_M1);
	}
}

/** Motor 2 configuration (Rsens = 1 Ohm) */
static int m2_raw_to_ma(int raw) {
	RAW_TO_MA_0_33_OHM(raw)
}

static int m2_ma_to_raw(int ma) {
	MA_TO_RAW_0_33_OHM(raw)
}

void m2_update_cb(void) {
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
		SET_EVENT(EVENT_MOTOR_M2);
	}
}

static void acc_cb(int x, int y, int z) {
	vmVariables.acc[0] = x;
	vmVariables.acc[1] = y;
	vmVariables.acc[2] = z;
	
//	vmVariables.battery_voltage = ds2777_read_global_voltage();
	
	SET_EVENT(EVENT_ACC);
}

static int ir_state;
static int adc_channel;

#define STATE_IR0   0
#define STATE_HALL0 1 
#define STATE_IR1   2
#define STATE_HALL1 3
#define STATE_IR2   4
#define STATE_HALL2 5

#define A_IR0       8
#define A_IR1       9
#define A_IR2       10
#define A_HALL0     11
#define A_HALL1     12
#define A_HALL2     13

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

/* Definition of sensor data-structure. */
typedef struct {
    
    unsigned int sen_t2;    /* Present sensor value */
    unsigned int sen_t1;    /* Past sensor value */
    
    unsigned int time;      /* Time count between change of sensor value */
    unsigned int count;     /* Pulse count between change of sensor value */
    unsigned int delta;     /* Pulse count between change of sensor value */
    unsigned int state;     /* The state of the encoder software */
    
    unsigned long pos;      /* Compute position with respect to the reference position */
    unsigned int  speed;    /* Difference last two reference pulse */
    unsigned long speed_info_acc; /* speed accumulator, for filter */
    unsigned int  r_count;
        
} hall_dig_enc_data;
static hall_dig_enc_data HALL_DIG_2_EN_DATA;

/*Initialize the sensor data structure to zeros*/
void hall_dig_enc_init_16(hall_dig_enc_data *d) {
	memset(d, 0, sizeof(hall_dig_enc_data));
    d->sen_t1 = gpio_read(HALL_DIG2);
}

/*
 * Moving average using bit shift.
 * Sample size: samSize = 2^samSize
 * Reference: http://electronics.stackexchange.com/questions/30370/...
 *             ...fast-and-memory-efficient-moving-average-calculation 
 * Round by adding 0.5 and truncating.
 */
void IIR_mov_avg(hall_dig_enc_data *d, int samSize){
    unsigned int sample = d->speed << 16;
    d->speed_info_acc += (sample - d->speed_info_acc) >> samSize;    
    d->speed = (unsigned int)((d->speed_info_acc + 0x8000) >> 16);    
}

/* Measure the speed from the hall sensor pulses
 * 1000000 micro second = 1 second
 * 13334 = 1000000 / 75 micro second
 */
void get_rot_speed(hall_dig_enc_data *d){
    bool cond = (d->count!=0 && ((d->count%2)==0));
    
    unsigned int temp;
    if (cond){
        ++d->r_count;
        temp = 1000000/vmVariables.timer;
        temp = temp/d->time;
        d->speed = 60 * temp;         
        d->time = 0;
    }    
}

void timer_cb(int __attribute((unused)) timer_id) {
/* Callback for the ASEBA timer */    
	vmVariables.hall_d[2] = gpio_read(HALL_DIG2);
    HALL_DIG_2_EN_DATA.sen_t2 = vmVariables.hall_d[2];
    HALL_DIG_2_EN_DATA.delta  = abs(HALL_DIG_2_EN_DATA.sen_t2 - HALL_DIG_2_EN_DATA.sen_t1);
    
    if (HALL_DIG_2_EN_DATA.state == 0){        
        HALL_DIG_2_EN_DATA.speed          = 0;
        HALL_DIG_2_EN_DATA.time           = 0;
        HALL_DIG_2_EN_DATA.count          = 0;    
        HALL_DIG_2_EN_DATA.r_count        = 0;
        HALL_DIG_2_EN_DATA.speed_info_acc = 0;
        
        if (HALL_DIG_2_EN_DATA.delta != 0) HALL_DIG_2_EN_DATA.state = 1;
    }
    else if (HALL_DIG_2_EN_DATA.state == 1) {
    if (HALL_DIG_2_EN_DATA.time > 26668)   HALL_DIG_2_EN_DATA.state = 0; // check 2 seconds
    if (HALL_DIG_2_EN_DATA.count >= 32764) HALL_DIG_2_EN_DATA.count = 0; // overflow check
    
    if (HALL_DIG_2_EN_DATA.delta != 0){
			++HALL_DIG_2_EN_DATA.count;
			++HALL_DIG_2_EN_DATA.time;
			
            get_rot_speed(&HALL_DIG_2_EN_DATA);
    } 
		else ++HALL_DIG_2_EN_DATA.time;
  }  
    
    /* Update the variables */
    HALL_DIG_2_EN_DATA.sen_t1 = HALL_DIG_2_EN_DATA.sen_t2;    
    vmVariables.speed2 = HALL_DIG_2_EN_DATA.speed;
    vmVariables.r_count2 = HALL_DIG_2_EN_DATA.r_count;
    SET_EVENT(EVENT_TIMER);
}

AsebaNativeFunctionDescription AsebaNativeDescription__system_tunning_osctun =
{
	"_system.tunning.osctun",
	"Tune the osctun register",
	{
		{ 1, "value"},
		{ 0, 0 }
	}
};

void AsebaNative__system_tunning_osctun(AsebaVMState *vm) {

	uint16 value = vm->variables[AsebaNativePopArg(vm)];
	if((value < 0)||(value > 63)) {
		AsebaVMEmitNodeSpecificError(vm, "Value out of range (0..63)");
		return;
	}

	// Make sure we are on a "safe" oscillator (internal RC w/o pll)
	__builtin_write_OSCCONH(CLOCK_FRC); 
	__builtin_write_OSCCONL(OSCCONL | 0x1); // Initiate the switch
	
	// Wait for the switch to complete
	while(OSCCONbits.OSWEN)
		barrier();
	
	OSCTUN = value;
	
	// New oscillator selection bits
	__builtin_write_OSCCONH(CLOCK_FRCPLL); 
	__builtin_write_OSCCONL(OSCCONL | 0x1); // Initiate the switch

	// Wait for PLL to lock
	while(OSCCONbits.LOCK!=1)
		barrier();
		
	// Wait for the switch to complete
	while(OSCCONbits.OSWEN)
		barrier();
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

AsebaNativeFunctionDescription AsebaNativeDescription_motor_set_break_mode = {
	"motor.set_break_mode",
	"Set the motor break mode",
	{
		
		{1, "0 = disabled, 1 = enabled"},
		{0,0}
	}
};

void AsebaNative_motor_set_break_mode(AsebaVMState * vm) {
	int enabled = vm->variables[AsebaNativePopArg(vm)];
	switch (enabled)
	{
		case 1 :
			pwm_set_brake(PWM_1, PWM_ONE_DEFAULT_LOW);
			pwm_set_brake(PWM_2, PWM_ONE_DEFAULT_LOW);
			pwm_set_brake(PWM_3, PWM_ONE_DEFAULT_LOW);
			break;
		case 0 :		
			pwm_set_brake(PWM_1, PWM_ONE_DEFAULT_HIGH);
			pwm_set_brake(PWM_2, PWM_ONE_DEFAULT_HIGH);
			pwm_set_brake(PWM_3, PWM_ONE_DEFAULT_HIGH);
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
}

void update_aseba_variables_write(void) {
	static int old_period;
	static int old_timer;

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
    
    if(old_timer != vmVariables.timer) {
        old_timer = vmVariables.timer;

        if(old_timer < 0) {
            AsebaVMEmitNodeSpecificError(&vmState, "Wrong timer value");
            old_timer = 0;
            vmVariables.timer = 0;
        }
        if(old_timer) {
            timer_disable(TIME_TIMER);
            timer_set_period(TIME_TIMER, old_timer, 6);
            timer_enable(TIME_TIMER);
        } else
            timer_disable(TIME_TIMER);
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
	
	timer_init(m0_PID_TIMER, 10, 3);
	timer_enable_interrupt(m0_PID_TIMER, m0_timer_cb, PRIO_PID);
	
	timer_init(m1_PID_TIMER, 10, 3);
	timer_enable_interrupt(m1_PID_TIMER, m1_timer_cb, PRIO_PID);
	
	timer_init(m2_PID_TIMER, 10, 3);
	timer_enable_interrupt(m2_PID_TIMER, m2_timer_cb, PRIO_PID);
	
	pwm_init(PWM_PRESCALER_1, 700, PWM_CONTINUOUS_UP_DOWN);
	
	i2c_init(I2C_1);
	i2c_init_master(I2C_1, 400000, PRIO_I2C);
	
	lis331_init(I2C_1, 0x18, TIMER_89, 1, acc_cb);    
	
	MOTOR_INIT(m0)
	MOTOR_INIT(m1)
	MOTOR_INIT(m2)
	
	timer_init(IR_PULSE, 300, 6); // 300 uS
	timer_enable_interrupt(IR_PULSE, timer_pulse_cb, PRIO_IR);
	
    timer_init(IR_PERIOD, 100,3); // Don't care about the timeout
	timer_enable_interrupt(IR_PERIOD, timer_period_cb, PRIO_IR);
	
    /* 
     * 75 microsecond (meaning every 7.2 degree to rotation)
     * Approximate pulse every two degree of rotation
     */    
    hall_dig_enc_init_16(&HALL_DIG_2_EN_DATA);  
    timer_init(TIME_TIMER, 75, 6);
    timer_enable_interrupt(TIME_TIMER, timer_cb, PRIO_ENCODER);
    
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