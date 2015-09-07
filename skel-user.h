#define Foot1 1
#define Foot2 2

#define NODE_NAME Foot2

#include <motor-csp/motor-csp.h>
#include <i2c/i2c.h>
#include <lis331.h>
#include <ds2777.h>

#define PRODUCT_ID ASEBA_PID_UNDEFINED

// No multiple include protection since this file must ONLY BE INCLUDED FROM SKEL.h

// DMA Channels to use with CAN
#define DMA_CAN_RX DMA_CHANNEL_0
#define DMA_CAN_TX DMA_CHANNEL_1

// GPIO to use to set CAN speed
#define CAN_SELECT_MODE GPIO_MAKE_ID(GPIO_PORTD,7)

// CAN interrupt priority
#define PRIO_CAN 4


/* Send queue size may be smaller (64 is the smallest value) something like 70-80 is better
   128 is luxury */
#define SEND_QUEUE_SIZE 128

/* Warning, at least an aseba message MUST be able to fit into this RECV_QUEUE_SIZE buffer */
/* 256 is IMHO the minimum, but maybe it can be lowered with a lot of caution.
 * The bigger you have, the best it is. Fill the empty ram with it :)
 */
#define RECV_QUEUE_SIZE 756

/* This is the number of "private" variable the aseba script can have */
#define VM_VARIABLES_FREE_SPACE 512 // 256 initially


/* This is the maximum number of argument an aseba event can recieve */
#define VM_VARIABLES_ARG_SIZE 32


/* The number of opcode an aseba script can have */
#define VM_BYTECODE_SIZE (766 + 0) // PUT HERE 766 + 768 * a, where a is >= 0
#define VM_STACK_SIZE 32



struct _vmVariables {
	// NodeID
	sint16 id;
	// source
	sint16 source;
	// args
	sint16 args[VM_VARIABLES_ARG_SIZE];
	
	sint16 fwversion[2];

	sint16 productid;
	
	MOTOR_VMVAR(m0)
	MOTOR_VMVAR(m1)
	MOTOR_VMVAR(m2)
	
	sint16 led[4];
	sint16 user_switch;
	sint16 battery_id[4];
	sint16 battery_voltage;
	sint16 battery_temperature;
	
	sint16 hall_d[3];
	sint16 hall_analog[3];
	sint16 ir_ambiant[3];
	sint16 ir_reflected[3];
	sint16 ir_delta[3];
	
	sint16 period;
	sint16 acc[3];
    sint16 timer;
    
    sint16 speed2;
    sint16 r_count2;
	// free space
	sint16 freeSpace[VM_VARIABLES_FREE_SPACE];
};


enum Events
{
/****
---> PUT YOUR EVENT NUMBER HERE <---
Must be in the same order as in skel.c
****/
	EVENT_MOTOR_M0 = 0,
	EVENT_M0_OVERCURRENT,
	EVENT_M0_OVERCURRENT_CLEARED,
	EVENT_MOTOR_M1,
	EVENT_M1_OVERCURRENT,
	EVENT_M1_OVERCURRENT_CLEARED,
	EVENT_MOTOR_M2,
	EVENT_M2_OVERCURRENT,
	EVENT_M2_OVERCURRENT_CLEARED,

	EVENT_ACC,
    EVENT_TIMER, /*!< Timer event. */
	EVENT_SENSORS,
	EVENTS_COUNT // Do not touch
};

// The content of this structure is implementation-specific.
// The glue provide a way to store and retrive it from flash.
// The only way to write it is to do it from inside the VM (native function)
// The native function access it as a integer array. So, use only int inside this structure
struct private_settings {
	/* ADD here the settings to save into flash */
	/* The minimum size is one integer, the maximum size is 95 integer (Check done at compilation) */
	MOTOR_PRIVSET(m0)
	MOTOR_PRIVSET(m1)
	MOTOR_PRIVSET(m2)
};

