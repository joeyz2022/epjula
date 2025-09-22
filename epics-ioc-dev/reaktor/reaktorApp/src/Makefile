TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = reaktor
# reaktor.dbd will be created and installed
DBD += reaktor.dbd

# reaktor.dbd will be made up from these files:
reaktor_DBD += base.dbd

# Include dbd files from all support applications:
#reaktor_DBD += xxx.dbd
reaktor_DBD += asyn.dbd
reaktor_DBD += drvAsynSerialPort.dbd
reaktor_DBD += calc.dbd
reaktor_DBD += stream.dbd
reaktor_DBD += bronkhorstFloat.dbd
reaktor_DBD += reccaster.dbd
reaktor_DBD += modbusApp.dbd



# Add all the support libraries needed by this IOC
#reaktor_LIBS += xxx
reaktor_LIBS += asyn
reaktor_LIBS += calc
reaktor_LIBS += stream
reaktor_LIBS += reccaster
reaktor_LIBS += modbus

# reaktor_registerRecordDeviceDriver.cpp derives from reaktor.dbd
reaktor_SRCS += reaktor_registerRecordDeviceDriver.cpp
reaktor_SRCS += bronkhorstFloat.c

# Build the main IOC entry point on workstation OSs.
reaktor_SRCS_DEFAULT += reaktorMain.cpp
reaktor_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#reaktor_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
reaktor_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

