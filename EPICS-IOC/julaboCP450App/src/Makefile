TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = julaboCP450
# julaboCP450.dbd will be created and installed
DBD += julaboCP450.dbd

# julaboCP450.dbd will be made up from these files:
julaboCP450_DBD += base.dbd

# Include dbd files from all support applications:
#julaboCP450_DBD += xxx.dbd
julaboCP450_DBD += asyn.dbd
julaboCP450_DBD += drvAsynSerialPort.dbd
julaboCP450_DBD += calc.dbd
julaboCP450_DBD += stream.dbd
#julaboCP450_DBD += bronkhorstFloat.dbd
julaboCP450_DBD += reccaster.dbd
julaboCP450_DBD += modbusApp.dbd



# Add all the support libraries needed by this IOC
#julaboCP450_LIBS += xxx
julaboCP450_LIBS += asyn
julaboCP450_LIBS += calc
julaboCP450_LIBS += stream
julaboCP450_LIBS += reccaster
julaboCP450_LIBS += modbus

# julaboCP450_registerRecordDeviceDriver.cpp derives from julaboCP450.dbd
julaboCP450_SRCS += julaboCP450_registerRecordDeviceDriver.cpp
#julaboCP450_SRCS += bronkhorstFloat.c

# Build the main IOC entry point on workstation OSs.
julaboCP450_SRCS_DEFAULT += julaboCP450Main.cpp
julaboCP450_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#julaboCP450_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
julaboCP450_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

