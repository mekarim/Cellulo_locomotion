#ifndef _HALL_DIG_ENC_H
#define _HALL_DIG_ENC_H

#define HALL_DIG_ENC_VMDESC(name) 	
    { 1, #name ".pid._period"}, \
	{ 1, #name ".pid._kp_i"}, \
	{ 1, #name ".pid._ki_i"}, \
	{ 1, #name ".pid._scaler_i"}, \
	{ 1, #name ".pwm"} , \
	{ 1, #name ".pid._prescaler_s"}, \
	{ 1, #name ".pid._current_speed_pulse" }, \
	{ 1, #name ".pid._target_speed_pulse" }, 

#define HALL_DIG_ENC_VMVAR(name)		
    sint16 name##_pid_period; \
	sint16 name##_kp_i; \
	sint16 name##_ki_i; \
	sint16 name##_scaler_i; \
	sint16 name##_pwm_output; \
	sint16 name##_prescaler_s; \
	sint16 name##_speed_read; \
	sint16 name##_speed_target; \
	sint16 name##_kp_s; \
	sint16 name##_ki_s; 	           


typedef struct {
    
    unsigned int sen_t2;
    unsigned int sen_t1;
    
    unsigned int time;
    unsigned int count;
    unsigned int delta;
    unsigned int state;   /**< the state of the system*/
    
    unsigned long* pos;	  /**< compute position with respect to the refernce pulses*/
    unsigned int*  speed; /**< difference of last two reference pulse (i.e. speed) */
    unsigned long  speed_info_acc; /* speed acculamtor, for filter */
    unsigned int*  r_count;
        
} hall_dig_enc_data;


#define HALL_DIG_ENC_INIT(name, sen_num, gpio gpio_dir)
    hall_dig_enc_init_16(&name##_EN_DATA); 				                               \
    name##_EN_DATA.sen_t1  = gpio_read(gpio_dir);                                      \
    name##_EN_DATA.speed   = (unsigned int *) &vmVariables.name##_rpm[##sen_num];      \
    name##_EN_DATA.pos     = (unsigned int *) &vmVariables.name##_pos[##sen_num];      \
    name##_EN_DATA.r_count = (unsigned int *) &vmVariables.name##_r_count[##sen_num];  \   
    

#define HALL_DIG_ENC_ONE_STEP(name)
    hall_dig_enc_step(&name##_EN_DATA);     \ 
            
#endif