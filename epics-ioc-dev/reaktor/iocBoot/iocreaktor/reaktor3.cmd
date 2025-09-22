#!../../bin/linux-x86_64/reaktor

#- You may have to change reaktor to something else
#- everywhere it appears in this file

< envPaths

# Bind to lab net only
epicsEnvSet EPICS_CAS_INTF_ADDR_LIST 10.0.0.1
epicsEnvSet EPICS_CAS_BEACON_ADDR_LIST 10.0.1.255
epicsEnvSet EPICS_CA_AUTO_ADDR_LIST 0
epicsEnvSet EPICS_CA_ADDR_LIST 10.0.1.255

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db"

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/reaktor.dbd"
reaktor_registerRecordDeviceDriver pdbbase


# X-418 Analog Inputs general
#drvAsynIPPortConfigure("AI0","10.0.0.xx:502",0,0,1)
#drvModbusAsynConfigure("AI0_1", "AI0", 1, 3, 0x00, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_2", "AI0", 1, 3, 0x02, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_3", "AI0", 1, 3, 0x04, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_4", "AI0", 1, 3, 0x06, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_5", "AI0", 1, 3, 0x08, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_6", "AI0", 1, 3, 0x0A, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_7", "AI0", 1, 3, 0x0E, 2, 7, 100, "ai0")
#drvModbusAsynConfigure("AI0_8", "AI0", 1, 3, 0x10, 2, 7, 100, "ai0")

# X-418 Specific Conf for Pressuresensors
drvAsynIPPortConfigure("PRESSURE0","10.0.0.16:502",0,0,1)
modbusInterposeConfig("PRESSURE0",0,2000,0)
#Attention! The Names (1st parameter) must be identical with macros when the db-Files are loaded!
drvModbusAsynConfigure("PRESSURE0_1", "PRESSURE0", 1, 3, 0x00, 2, 7, 100, "pressure0")
drvModbusAsynConfigure("PRESSURE0_2", "PRESSURE0", 1, 3, 0x02, 2, 7, 100, "pressure0")

# setup Serial Ports
# Eurotherm 1
drvAsynSerialPortConfigure("EUROTH_01","/dev/COM1",0,0,0)
#drvAsynSerialPortConfigure("EUROTH_01","/dev/ttyUSB0",0,0,0)
#asynSetOption("EUROTH_01",0, "baud", "9600")
asynSetOption("EUROTH_01",0, "baud", "19200")
asynSetOption("EUROTH_01",0, "bits", "8")
asynSetOption("EUROTH_01",0, "parity", "none")
asynSetOption("EUROTH_01",0, "stop", "1")
modbusInterposeConfig("EUROTH_01",1,2000,0)
#Attention! The Names (1st parameter) must be identical with macros when the db-Files are loaded!
#define IN
drvModbusAsynConfigure("PvFloat1", "EUROTH_01", 1, 03, -1, 6, 0, 1000, "EUROTH_01")
#define OUT
drvModbusAsynConfigure("PvFloatout1", "EUROTH_01", 1, 16, -1, 6, 0, 1000, "EUROTH_01")

# Bronkhorst MFCs
#FLOW1
drvAsynSerialPortConfigure("COM3","/dev/COM3",0,0,0)
asynSetOption("COM3",0, "baud", "38400")
asynSetOption("COM3",0, "bits", "8")
asynSetOption("COM3",0, "parity", "none")
asynSetOption("COM3",0, "stop", "1")
#FLOW2
drvAsynSerialPortConfigure("COM4","/dev/COM4",0,0,0)
asynSetOption("COM4",0, "baud", "38400")
asynSetOption("COM4",0, "bits", "8")
asynSetOption("COM4",0, "parity", "none")
asynSetOption("COM4",0, "stop", "1")
#FLOW3
drvAsynSerialPortConfigure("COM5","/dev/COM5",0,0,0)
asynSetOption("COM5",0, "baud", "38400")
asynSetOption("COM5",0, "bits", "8")
asynSetOption("COM5",0, "parity", "none")
asynSetOption("COM5",0, "stop", "1")
#FLOW4
drvAsynSerialPortConfigure("COM6","/dev/COM6",0,0,0)
asynSetOption("COM6",0, "baud", "38400")
asynSetOption("COM6",0, "bits", "8")
asynSetOption("COM6",0, "parity", "none")
asynSetOption("COM6",0, "stop", "1")
#FLOW5
#drvAsynSerialPortConfigure("COM7","/dev/COM7",0,0,0)
#asynSetOption("COM7",0, "baud", "38400")
#asynSetOption("COM7",0, "bits", "8")
#asynSetOption("COM7",0, "parity", "none")
#asynSetOption("COM7",0, "stop", "1")
#Pressurecntrl
drvAsynSerialPortConfigure("COM8","/dev/COM8",0,0,0)
asynSetOption("COM8",0, "baud", "38400")
asynSetOption("COM8",0, "bits", "8")
asynSetOption("COM8",0, "parity", "none")
asynSetOption("COM8",0, "stop", "1")
#open
#drvAsynSerialPortConfigure("COM10","/dev/COM10",0,0,0)
#asynSetOption("COM10",0, "baud", "9600")
#asynSetOption("COM10",0, "bits", "8")
#asynSetOption("COM10",0, "parity", "none")
#asynSetOption("COM10",0, "stop", "1")


## Load record instances
#dbLoadRecords("db/xxx.db","user=epics")
#pattern Bronkhorst	: "P=FHIISC, R=REAKTORX, N=NAMEOFDEVICE, I=PORTOFDEVICE"
#examplepattern		: dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW1, I=COM3, U=UNIT, T=NODE")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=FLOW1, I=COM3, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=FLOW2, I=COM4, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=FLOW3, I=COM5, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=FLOW4, I=COM6, U=ml/min, T=80")
#dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=FLOW5, I=COM7, U=ml/min, T=80")

#dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=AIR_REA3, I=COM , U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR3, N=PRESSURECTL, I=COM8 , U=bar   , T=80")

#Attention! The Names (I= and O=) must be identical with the names defined in drvModbusAsynConfigure!I=In and O=Out
dbLoadTemplate("db/eurotherm35xx.substitutions", "P=FHIISC, R=REAKTOR3, N=EUROMOD1, I=PvFloat1, O=PvFloatout1")

#pattern Pressuresensor	: "P=FHIISC, R=REAKTORX, N=NAMEOFDEVICE, C=CALC"
#examplepattern			: dbLoadRecords("db/pressure.db","P=FHIISC, R=REAKTOR2, N=PRESSURE0_1, C=A*20")
#Attention! The Name (N=) must be identical with the name defined in drvModbusAsynConfigure! C= is a formula 
dbLoadRecords("db/X418.db","P=FHIISC, R=REAKTOR3, N=PRESSURE0_1, C=A*20")
dbLoadRecords("db/X418.db","P=FHIISC, R=REAKTOR3, N=PRESSURE0_2, C=A*20")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=epics"
