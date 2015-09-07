#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../../aseba/vm/natives.c ../../../../aseba/vm/vm.c ../../../../aseba/transport/buffer/vm-buffer.c ../../../../aseba/transport/can/can-buffer.c ../../../../aseba/transport/can/can-net.c ../../../common/dspic/glue/skel.c ../../../../DSP33_cellulo_vib/molole/can/can.c ../../../../DSP33_cellulo_vib/molole/dma/dma.c ../../../../DSP33_cellulo_vib/molole/gpio/gpio.c ../../../../DSP33_cellulo_vib/molole/clock/clock.c ../../../../DSP33_cellulo_vib/molole/error/error.c ../../../../DSP33_cellulo_vib/molole/adc/adc.c ../../../../DSP33_cellulo_vib/molole/encoder/encoder.c ../../../../DSP33_cellulo_vib/molole/motor-csp/motor-csp.c ../../../../DSP33_cellulo_vib/molole/i2c/i2c.c ../../../../DSP33_cellulo_vib/molole/ic/ic.c ../../../../DSP33_cellulo_vib/molole/flash/flash.c ../../../../DSP33_cellulo_vib/molole/pwm/pwm.c ../../../../DSP33_cellulo_vib/molole/timer/timer.c ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/ds2777.c ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/lis331.c ../../../../DSP33_cellulo_vib/molole/i2c/master.c ../../../../DSP33_cellulo_vib/molole/i2c/master_protocol.c ../main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1140433100/natives.o ${OBJECTDIR}/_ext/1140433100/vm.o ${OBJECTDIR}/_ext/145293405/vm-buffer.o ${OBJECTDIR}/_ext/1838315699/can-buffer.o ${OBJECTDIR}/_ext/1838315699/can-net.o ${OBJECTDIR}/_ext/713563870/skel.o ${OBJECTDIR}/_ext/1193877530/can.o ${OBJECTDIR}/_ext/1193876210/dma.o ${OBJECTDIR}/_ext/1644635769/gpio.o ${OBJECTDIR}/_ext/559706460/clock.o ${OBJECTDIR}/_ext/557677410/error.o ${OBJECTDIR}/_ext/1193879370/adc.o ${OBJECTDIR}/_ext/814541362/encoder.o ${OBJECTDIR}/_ext/822778818/motor-csp.o ${OBJECTDIR}/_ext/1193873232/i2c.o ${OBJECTDIR}/_ext/2039697988/ic.o ${OBJECTDIR}/_ext/556948858/flash.o ${OBJECTDIR}/_ext/1193864356/pwm.o ${OBJECTDIR}/_ext/544097829/timer.o ${OBJECTDIR}/_ext/2027221979/ds2777.o ${OBJECTDIR}/_ext/2027221979/lis331.o ${OBJECTDIR}/_ext/1193873232/master.o ${OBJECTDIR}/_ext/1193873232/master_protocol.o ${OBJECTDIR}/_ext/1472/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1140433100/natives.o.d ${OBJECTDIR}/_ext/1140433100/vm.o.d ${OBJECTDIR}/_ext/145293405/vm-buffer.o.d ${OBJECTDIR}/_ext/1838315699/can-buffer.o.d ${OBJECTDIR}/_ext/1838315699/can-net.o.d ${OBJECTDIR}/_ext/713563870/skel.o.d ${OBJECTDIR}/_ext/1193877530/can.o.d ${OBJECTDIR}/_ext/1193876210/dma.o.d ${OBJECTDIR}/_ext/1644635769/gpio.o.d ${OBJECTDIR}/_ext/559706460/clock.o.d ${OBJECTDIR}/_ext/557677410/error.o.d ${OBJECTDIR}/_ext/1193879370/adc.o.d ${OBJECTDIR}/_ext/814541362/encoder.o.d ${OBJECTDIR}/_ext/822778818/motor-csp.o.d ${OBJECTDIR}/_ext/1193873232/i2c.o.d ${OBJECTDIR}/_ext/2039697988/ic.o.d ${OBJECTDIR}/_ext/556948858/flash.o.d ${OBJECTDIR}/_ext/1193864356/pwm.o.d ${OBJECTDIR}/_ext/544097829/timer.o.d ${OBJECTDIR}/_ext/2027221979/ds2777.o.d ${OBJECTDIR}/_ext/2027221979/lis331.o.d ${OBJECTDIR}/_ext/1193873232/master.o.d ${OBJECTDIR}/_ext/1193873232/master_protocol.o.d ${OBJECTDIR}/_ext/1472/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1140433100/natives.o ${OBJECTDIR}/_ext/1140433100/vm.o ${OBJECTDIR}/_ext/145293405/vm-buffer.o ${OBJECTDIR}/_ext/1838315699/can-buffer.o ${OBJECTDIR}/_ext/1838315699/can-net.o ${OBJECTDIR}/_ext/713563870/skel.o ${OBJECTDIR}/_ext/1193877530/can.o ${OBJECTDIR}/_ext/1193876210/dma.o ${OBJECTDIR}/_ext/1644635769/gpio.o ${OBJECTDIR}/_ext/559706460/clock.o ${OBJECTDIR}/_ext/557677410/error.o ${OBJECTDIR}/_ext/1193879370/adc.o ${OBJECTDIR}/_ext/814541362/encoder.o ${OBJECTDIR}/_ext/822778818/motor-csp.o ${OBJECTDIR}/_ext/1193873232/i2c.o ${OBJECTDIR}/_ext/2039697988/ic.o ${OBJECTDIR}/_ext/556948858/flash.o ${OBJECTDIR}/_ext/1193864356/pwm.o ${OBJECTDIR}/_ext/544097829/timer.o ${OBJECTDIR}/_ext/2027221979/ds2777.o ${OBJECTDIR}/_ext/2027221979/lis331.o ${OBJECTDIR}/_ext/1193873232/master.o ${OBJECTDIR}/_ext/1193873232/master_protocol.o ${OBJECTDIR}/_ext/1472/main.o

# Source Files
SOURCEFILES=../../../../aseba/vm/natives.c ../../../../aseba/vm/vm.c ../../../../aseba/transport/buffer/vm-buffer.c ../../../../aseba/transport/can/can-buffer.c ../../../../aseba/transport/can/can-net.c ../../../common/dspic/glue/skel.c ../../../../DSP33_cellulo_vib/molole/can/can.c ../../../../DSP33_cellulo_vib/molole/dma/dma.c ../../../../DSP33_cellulo_vib/molole/gpio/gpio.c ../../../../DSP33_cellulo_vib/molole/clock/clock.c ../../../../DSP33_cellulo_vib/molole/error/error.c ../../../../DSP33_cellulo_vib/molole/adc/adc.c ../../../../DSP33_cellulo_vib/molole/encoder/encoder.c ../../../../DSP33_cellulo_vib/molole/motor-csp/motor-csp.c ../../../../DSP33_cellulo_vib/molole/i2c/i2c.c ../../../../DSP33_cellulo_vib/molole/ic/ic.c ../../../../DSP33_cellulo_vib/molole/flash/flash.c ../../../../DSP33_cellulo_vib/molole/pwm/pwm.c ../../../../DSP33_cellulo_vib/molole/timer/timer.c ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/ds2777.c ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/lis331.c ../../../../DSP33_cellulo_vib/molole/i2c/master.c ../../../../DSP33_cellulo_vib/molole/i2c/master_protocol.c ../main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC706
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC706.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1140433100/natives.o: ../../../../aseba/vm/natives.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140433100" 
	@${RM} ${OBJECTDIR}/_ext/1140433100/natives.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140433100/natives.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/vm/natives.c  -o ${OBJECTDIR}/_ext/1140433100/natives.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1140433100/natives.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140433100/natives.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1140433100/vm.o: ../../../../aseba/vm/vm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140433100" 
	@${RM} ${OBJECTDIR}/_ext/1140433100/vm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140433100/vm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/vm/vm.c  -o ${OBJECTDIR}/_ext/1140433100/vm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1140433100/vm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140433100/vm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/145293405/vm-buffer.o: ../../../../aseba/transport/buffer/vm-buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/145293405" 
	@${RM} ${OBJECTDIR}/_ext/145293405/vm-buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/145293405/vm-buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/transport/buffer/vm-buffer.c  -o ${OBJECTDIR}/_ext/145293405/vm-buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/145293405/vm-buffer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/145293405/vm-buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1838315699/can-buffer.o: ../../../../aseba/transport/can/can-buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1838315699" 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/transport/can/can-buffer.c  -o ${OBJECTDIR}/_ext/1838315699/can-buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1838315699/can-buffer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1838315699/can-buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1838315699/can-net.o: ../../../../aseba/transport/can/can-net.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1838315699" 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-net.o.d 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-net.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/transport/can/can-net.c  -o ${OBJECTDIR}/_ext/1838315699/can-net.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1838315699/can-net.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1838315699/can-net.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/713563870/skel.o: ../../../common/dspic/glue/skel.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/713563870" 
	@${RM} ${OBJECTDIR}/_ext/713563870/skel.o.d 
	@${RM} ${OBJECTDIR}/_ext/713563870/skel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../common/dspic/glue/skel.c  -o ${OBJECTDIR}/_ext/713563870/skel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/713563870/skel.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/713563870/skel.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193877530/can.o: ../../../../DSP33_cellulo_vib/molole/can/can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193877530" 
	@${RM} ${OBJECTDIR}/_ext/1193877530/can.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193877530/can.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/can/can.c  -o ${OBJECTDIR}/_ext/1193877530/can.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193877530/can.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193877530/can.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193876210/dma.o: ../../../../DSP33_cellulo_vib/molole/dma/dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193876210" 
	@${RM} ${OBJECTDIR}/_ext/1193876210/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193876210/dma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/dma/dma.c  -o ${OBJECTDIR}/_ext/1193876210/dma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193876210/dma.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193876210/dma.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1644635769/gpio.o: ../../../../DSP33_cellulo_vib/molole/gpio/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1644635769" 
	@${RM} ${OBJECTDIR}/_ext/1644635769/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1644635769/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/gpio/gpio.c  -o ${OBJECTDIR}/_ext/1644635769/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1644635769/gpio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1644635769/gpio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/559706460/clock.o: ../../../../DSP33_cellulo_vib/molole/clock/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/559706460" 
	@${RM} ${OBJECTDIR}/_ext/559706460/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/559706460/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/clock/clock.c  -o ${OBJECTDIR}/_ext/559706460/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/559706460/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/559706460/clock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/557677410/error.o: ../../../../DSP33_cellulo_vib/molole/error/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/557677410" 
	@${RM} ${OBJECTDIR}/_ext/557677410/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/557677410/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/error/error.c  -o ${OBJECTDIR}/_ext/557677410/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/557677410/error.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/557677410/error.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193879370/adc.o: ../../../../DSP33_cellulo_vib/molole/adc/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193879370" 
	@${RM} ${OBJECTDIR}/_ext/1193879370/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193879370/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/adc/adc.c  -o ${OBJECTDIR}/_ext/1193879370/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193879370/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193879370/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/814541362/encoder.o: ../../../../DSP33_cellulo_vib/molole/encoder/encoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/814541362" 
	@${RM} ${OBJECTDIR}/_ext/814541362/encoder.o.d 
	@${RM} ${OBJECTDIR}/_ext/814541362/encoder.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/encoder/encoder.c  -o ${OBJECTDIR}/_ext/814541362/encoder.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/814541362/encoder.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/814541362/encoder.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/822778818/motor-csp.o: ../../../../DSP33_cellulo_vib/molole/motor-csp/motor-csp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/822778818" 
	@${RM} ${OBJECTDIR}/_ext/822778818/motor-csp.o.d 
	@${RM} ${OBJECTDIR}/_ext/822778818/motor-csp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/motor-csp/motor-csp.c  -o ${OBJECTDIR}/_ext/822778818/motor-csp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/822778818/motor-csp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/822778818/motor-csp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193873232/i2c.o: ../../../../DSP33_cellulo_vib/molole/i2c/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193873232" 
	@${RM} ${OBJECTDIR}/_ext/1193873232/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193873232/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c/i2c.c  -o ${OBJECTDIR}/_ext/1193873232/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193873232/i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193873232/i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2039697988/ic.o: ../../../../DSP33_cellulo_vib/molole/ic/ic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2039697988" 
	@${RM} ${OBJECTDIR}/_ext/2039697988/ic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2039697988/ic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/ic/ic.c  -o ${OBJECTDIR}/_ext/2039697988/ic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2039697988/ic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2039697988/ic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/556948858/flash.o: ../../../../DSP33_cellulo_vib/molole/flash/flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/556948858" 
	@${RM} ${OBJECTDIR}/_ext/556948858/flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/556948858/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/flash/flash.c  -o ${OBJECTDIR}/_ext/556948858/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/556948858/flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/556948858/flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193864356/pwm.o: ../../../../DSP33_cellulo_vib/molole/pwm/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193864356" 
	@${RM} ${OBJECTDIR}/_ext/1193864356/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193864356/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/pwm/pwm.c  -o ${OBJECTDIR}/_ext/1193864356/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193864356/pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193864356/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/544097829/timer.o: ../../../../DSP33_cellulo_vib/molole/timer/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/544097829" 
	@${RM} ${OBJECTDIR}/_ext/544097829/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/544097829/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/timer/timer.c  -o ${OBJECTDIR}/_ext/544097829/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/544097829/timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/544097829/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2027221979/ds2777.o: ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/ds2777.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2027221979" 
	@${RM} ${OBJECTDIR}/_ext/2027221979/ds2777.o.d 
	@${RM} ${OBJECTDIR}/_ext/2027221979/ds2777.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/ds2777.c  -o ${OBJECTDIR}/_ext/2027221979/ds2777.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2027221979/ds2777.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2027221979/ds2777.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2027221979/lis331.o: ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/lis331.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2027221979" 
	@${RM} ${OBJECTDIR}/_ext/2027221979/lis331.o.d 
	@${RM} ${OBJECTDIR}/_ext/2027221979/lis331.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/lis331.c  -o ${OBJECTDIR}/_ext/2027221979/lis331.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2027221979/lis331.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2027221979/lis331.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193873232/master.o: ../../../../DSP33_cellulo_vib/molole/i2c/master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193873232" 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c/master.c  -o ${OBJECTDIR}/_ext/1193873232/master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193873232/master.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193873232/master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193873232/master_protocol.o: ../../../../DSP33_cellulo_vib/molole/i2c/master_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193873232" 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master_protocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master_protocol.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c/master_protocol.c  -o ${OBJECTDIR}/_ext/1193873232/master_protocol.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193873232/master_protocol.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193873232/master_protocol.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1140433100/natives.o: ../../../../aseba/vm/natives.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140433100" 
	@${RM} ${OBJECTDIR}/_ext/1140433100/natives.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140433100/natives.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/vm/natives.c  -o ${OBJECTDIR}/_ext/1140433100/natives.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1140433100/natives.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140433100/natives.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1140433100/vm.o: ../../../../aseba/vm/vm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140433100" 
	@${RM} ${OBJECTDIR}/_ext/1140433100/vm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140433100/vm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/vm/vm.c  -o ${OBJECTDIR}/_ext/1140433100/vm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1140433100/vm.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140433100/vm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/145293405/vm-buffer.o: ../../../../aseba/transport/buffer/vm-buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/145293405" 
	@${RM} ${OBJECTDIR}/_ext/145293405/vm-buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/145293405/vm-buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/transport/buffer/vm-buffer.c  -o ${OBJECTDIR}/_ext/145293405/vm-buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/145293405/vm-buffer.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/145293405/vm-buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1838315699/can-buffer.o: ../../../../aseba/transport/can/can-buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1838315699" 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/transport/can/can-buffer.c  -o ${OBJECTDIR}/_ext/1838315699/can-buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1838315699/can-buffer.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1838315699/can-buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1838315699/can-net.o: ../../../../aseba/transport/can/can-net.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1838315699" 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-net.o.d 
	@${RM} ${OBJECTDIR}/_ext/1838315699/can-net.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../aseba/transport/can/can-net.c  -o ${OBJECTDIR}/_ext/1838315699/can-net.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1838315699/can-net.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1838315699/can-net.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/713563870/skel.o: ../../../common/dspic/glue/skel.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/713563870" 
	@${RM} ${OBJECTDIR}/_ext/713563870/skel.o.d 
	@${RM} ${OBJECTDIR}/_ext/713563870/skel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../common/dspic/glue/skel.c  -o ${OBJECTDIR}/_ext/713563870/skel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/713563870/skel.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/713563870/skel.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193877530/can.o: ../../../../DSP33_cellulo_vib/molole/can/can.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193877530" 
	@${RM} ${OBJECTDIR}/_ext/1193877530/can.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193877530/can.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/can/can.c  -o ${OBJECTDIR}/_ext/1193877530/can.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193877530/can.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193877530/can.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193876210/dma.o: ../../../../DSP33_cellulo_vib/molole/dma/dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193876210" 
	@${RM} ${OBJECTDIR}/_ext/1193876210/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193876210/dma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/dma/dma.c  -o ${OBJECTDIR}/_ext/1193876210/dma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193876210/dma.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193876210/dma.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1644635769/gpio.o: ../../../../DSP33_cellulo_vib/molole/gpio/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1644635769" 
	@${RM} ${OBJECTDIR}/_ext/1644635769/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1644635769/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/gpio/gpio.c  -o ${OBJECTDIR}/_ext/1644635769/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1644635769/gpio.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1644635769/gpio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/559706460/clock.o: ../../../../DSP33_cellulo_vib/molole/clock/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/559706460" 
	@${RM} ${OBJECTDIR}/_ext/559706460/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/559706460/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/clock/clock.c  -o ${OBJECTDIR}/_ext/559706460/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/559706460/clock.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/559706460/clock.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/557677410/error.o: ../../../../DSP33_cellulo_vib/molole/error/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/557677410" 
	@${RM} ${OBJECTDIR}/_ext/557677410/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/557677410/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/error/error.c  -o ${OBJECTDIR}/_ext/557677410/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/557677410/error.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/557677410/error.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193879370/adc.o: ../../../../DSP33_cellulo_vib/molole/adc/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193879370" 
	@${RM} ${OBJECTDIR}/_ext/1193879370/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193879370/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/adc/adc.c  -o ${OBJECTDIR}/_ext/1193879370/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193879370/adc.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193879370/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/814541362/encoder.o: ../../../../DSP33_cellulo_vib/molole/encoder/encoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/814541362" 
	@${RM} ${OBJECTDIR}/_ext/814541362/encoder.o.d 
	@${RM} ${OBJECTDIR}/_ext/814541362/encoder.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/encoder/encoder.c  -o ${OBJECTDIR}/_ext/814541362/encoder.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/814541362/encoder.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/814541362/encoder.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/822778818/motor-csp.o: ../../../../DSP33_cellulo_vib/molole/motor-csp/motor-csp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/822778818" 
	@${RM} ${OBJECTDIR}/_ext/822778818/motor-csp.o.d 
	@${RM} ${OBJECTDIR}/_ext/822778818/motor-csp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/motor-csp/motor-csp.c  -o ${OBJECTDIR}/_ext/822778818/motor-csp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/822778818/motor-csp.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/822778818/motor-csp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193873232/i2c.o: ../../../../DSP33_cellulo_vib/molole/i2c/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193873232" 
	@${RM} ${OBJECTDIR}/_ext/1193873232/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193873232/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c/i2c.c  -o ${OBJECTDIR}/_ext/1193873232/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193873232/i2c.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193873232/i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2039697988/ic.o: ../../../../DSP33_cellulo_vib/molole/ic/ic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2039697988" 
	@${RM} ${OBJECTDIR}/_ext/2039697988/ic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2039697988/ic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/ic/ic.c  -o ${OBJECTDIR}/_ext/2039697988/ic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2039697988/ic.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2039697988/ic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/556948858/flash.o: ../../../../DSP33_cellulo_vib/molole/flash/flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/556948858" 
	@${RM} ${OBJECTDIR}/_ext/556948858/flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/556948858/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/flash/flash.c  -o ${OBJECTDIR}/_ext/556948858/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/556948858/flash.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/556948858/flash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193864356/pwm.o: ../../../../DSP33_cellulo_vib/molole/pwm/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193864356" 
	@${RM} ${OBJECTDIR}/_ext/1193864356/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193864356/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/pwm/pwm.c  -o ${OBJECTDIR}/_ext/1193864356/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193864356/pwm.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193864356/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/544097829/timer.o: ../../../../DSP33_cellulo_vib/molole/timer/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/544097829" 
	@${RM} ${OBJECTDIR}/_ext/544097829/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/544097829/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/timer/timer.c  -o ${OBJECTDIR}/_ext/544097829/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/544097829/timer.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/544097829/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2027221979/ds2777.o: ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/ds2777.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2027221979" 
	@${RM} ${OBJECTDIR}/_ext/2027221979/ds2777.o.d 
	@${RM} ${OBJECTDIR}/_ext/2027221979/ds2777.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/ds2777.c  -o ${OBJECTDIR}/_ext/2027221979/ds2777.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2027221979/ds2777.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2027221979/ds2777.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2027221979/lis331.o: ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/lis331.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2027221979" 
	@${RM} ${OBJECTDIR}/_ext/2027221979/lis331.o.d 
	@${RM} ${OBJECTDIR}/_ext/2027221979/lis331.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices/lis331.c  -o ${OBJECTDIR}/_ext/2027221979/lis331.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2027221979/lis331.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2027221979/lis331.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193873232/master.o: ../../../../DSP33_cellulo_vib/molole/i2c/master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193873232" 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c/master.c  -o ${OBJECTDIR}/_ext/1193873232/master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193873232/master.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193873232/master.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1193873232/master_protocol.o: ../../../../DSP33_cellulo_vib/molole/i2c/master_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1193873232" 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master_protocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/1193873232/master_protocol.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../DSP33_cellulo_vib/molole/i2c/master_protocol.c  -o ${OBJECTDIR}/_ext/1193873232/master_protocol.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1193873232/master_protocol.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1193873232/master_protocol.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -omf=elf -Os -I"../../../../DSP33_cellulo_vib/molole/i2c-devices" -I"../../../../aseba" -I"../" -I"../../../common/dspic/glue" -I"../../../../DSP33_cellulo_vib/molole" -I"../../../../DSP33_cellulo_vib/molole/i2c-devices/i2c-devices" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Cellulo_vibration.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
