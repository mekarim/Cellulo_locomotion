#include <p33Fxxxx.h>
#include "hall_encoder.h"

/* Function Prototypes */

static void hall_dig_enc_init_16(hall_dig_enc_data *d)
static void get_rot_speed(hall_dig_enc_data &d);
static void IIR_mov_avg(hall_dig_enc_data *d);


/* Empty structure initialize */
static void hall_dig_enc_init_16(hall_dig_enc_data *d) {
	memset(d, 0, sizeof(hall_dig_enc_data));
}

/* Measure the speed from the hall sensor pulses*/
static void get_rot_speed(hall_dig_enc_data &d){
    bool cond = (d->count!=0 && ((d->count%2)==0));
    bool cond = (cond &&  && d->state == 1);
    
    unsigned int temp;
    if (cond){
        ++d->r_count
        
        temp = 1000000/vmVariables.timer;
        temp = temp/time_2;
        temp = 60 * temp;
        
        d->speed = 60;
        IIR_Filter(&d);
        d->time = 0;
    }    
}

/* Approximately measure the motor phase assuming constant speed */
static void get_motor_phase(hall_dig_enc_data &d){    
    unsigned int temp;
    if (d->state == 1){
        d->pos = d->time * d->speed;
    }
}

//http://electronics.stackexchange.com/questions/30370/fast-and-memory-efficient-moving-average-calculation
static void IIR_mov_avg(hall_dig_enc_data *d){

  unsigned long sample = d->speed << 16;
  d->speed_info_acc += (sample - speed_info_acc);
  
  // Round by adding .5 and truncating.
  rpm_2 = ((d->speed_info_acc + 0x8000) >> 16);  
}

void hall_dig_enc_step(hall_dig_enc_data *d) {
  d.sen_t2 = gpio_read(gpio_dir);
  d.delta = abs(d.sen_t2 - d.sen_t1);
  
  if (d->state == 0) {
    d -> pos            = 0;
    d -> speed          = 0;
    d -> time           = 0;
    d -> count          = 0;    
    d -> r_count        = 0;
    d -> speed_info_acc = 0;
    
    
    if (d.delta != 0) d->state = 1;
  }
  else if (d->state == 1) {
    if (d->time > 12500)   d->state = 0; //check 2 secs
    if (d->count >= 32764) d->count = 0; //overflow check
    
    if (d->delta != 0){
			++d->count;
			++d->time;
			
      get_rot_speed(*d);
		} 
		else ++d->time;
  }
  
  // update sensor variables and aseba 
  d.sen_t1 = d.sen_t2;   
}



