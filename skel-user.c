/******
---> PUT YOUR VARIABLES DESCRIPTIONS HERE <---
first value is the number of element in the array (1 if not an array)
second value is the name of the variable which will be displayed in aseba studio
******/

const AsebaVMDescription vmDescription = {
	NODE_NAME, 	// Name of the microcontroller
    
        {
		{ 1, "_id" },	// Do not touch it
		{ 1, "event.source" }, // nor this one too
		{ VM_VARIABLES_ARG_SIZE, "event.args" },	// neither this one
		
		{ 2, "_fwversion"},
		{ 1, ASEBA_PID_VAR_NAME},
		
		MOTOR_VMDESC(m0)
		
		MOTOR_VMDESC(m1)
		
		MOTOR_VMDESC(m2)
		
		{ 4, "led"},
		{ 1, "user_switch"},
		
		{ 4, "battery.id"},
		{ 1, "battery.voltage"},
		{ 1, "battery.temperature"},
		
		{ 3, "hall_d"},
		{ 3, "hall_a"},
		
        { 3, "ir.ambiant"},
		{ 3, "ir.reflected"},
		{ 3, "ir.delta"},
		
        { 1, "sensors.period"},
		
		{ 3, "acc"},
        { 1, "timer"},
                
		{ 1, "rpm_2"},
        { 1, "rot_count_2"},
        { 1, "rpm_2_new"},
        { 1, "rot_count_2_new"},
		{ 0, NULL }	// null terminated
	}
};


static const AsebaLocalEventDescription localEvents[] = { 
	{"m0_motor", "M0 motor timer"},
	{"m0_ov", "M0 motor overcurrent"},
	{"m0_ov_cleared", "M0 motor overcurrent cleared"},
	
	{"m1_motor", "M1 motor timer"},
	{"m1_ov", "M1 motor overcurrent"},
	{"m1_ov_cleared", "M1 motor overcurrent cleared"},
	
	{"m2_motor", "M2 motor timer"},
	{"m2_ov", "M2 motor overcurrent"},
	{"m2_ov_cleared", "M2 motor overcurrent cleared"},
	
	{"acc", "Accelerometer updated"},
	{"timer0", "timer 0"},    
	{"sensors", "New analog sensors value"},	
	{ NULL, NULL }
};

void AsebaNative_lis331_set_mode(AsebaVMState * vm);
extern AsebaNativeFunctionDescription AsebaNativeDescription_lis331_set_mode;

void AsebaNative_motor_set_break_mode(AsebaVMState * vm);
extern AsebaNativeFunctionDescription AsebaNativeDescription_motor_set_break_mode;

void AsebaNative_battery_update_voltage(AsebaVMState * vm);
extern AsebaNativeFunctionDescription AsebaNativeDescription_battery_update_voltage;
void AsebaNative_battery_update_temperature(AsebaVMState * vm);
extern AsebaNativeFunctionDescription AsebaNativeDescription_battery_update_temperature;

static const AsebaNativeFunctionDescription* nativeFunctionsDescription[] = {
	&AsebaNativeDescription__system_reboot,
	&AsebaNativeDescription__system_settings_read,
	&AsebaNativeDescription__system_settings_write,
	&AsebaNativeDescription__system_settings_flash,
	
	&AsebaNativeDescription_lis331_set_mode,
	
	&AsebaNativeDescription_motor_set_break_mode,
	
	&AsebaNativeDescription_battery_update_voltage,
	&AsebaNativeDescription_battery_update_temperature,
	
	ASEBA_NATIVES_STD_DESCRIPTIONS,
	0	// null terminated
};

static AsebaNativeFunctionPointer nativeFunctions[] = {
	AsebaResetIntoBootloader,
	AsebaNative__system_settings_read,
	AsebaNative__system_settings_write,
	AsebaNative__system_settings_flash,
	
	AsebaNative_lis331_set_mode,
	
	AsebaNative_motor_set_break_mode,

	AsebaNative_battery_update_voltage,
	AsebaNative_battery_update_temperature,

	ASEBA_NATIVES_STD_FUNCTIONS,
};