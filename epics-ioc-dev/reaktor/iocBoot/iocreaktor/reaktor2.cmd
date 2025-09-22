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
drvAsynIPPortConfigure("PRESSURE0","10.0.0.43:502",0,0,1)
modbusInterposeConfig("PRESSURE0",0,2000,0)
#Attention! The Names (1st parameter) must be identical with macros when the db-Files are loaded!
drvModbusAsynConfigure("PRESSURE0_1", "PRESSURE0", 1, 3, 0x00, 2, 7, 100, "pressure0")
drvModbusAsynConfigure("PRESSURE0_2", "PRESSURE0", 1, 3, 0x02, 2, 7, 100, "pressure0")

# setup Serial Ports
# Eurotherm 1
drvAsynSerialPortConfigure("EUROTH_01","/dev/COM9",0,0,0)
#asynSetOption("EUROTH_01",0, "baud", "9600")
asynSetOption("EUROTH_01",0, "baud", "4800")
asynSetOption("EUROTH_01",0, "bits", "8")
asynSetOption("EUROTH_01",0, "parity", "none")
asynSetOption("EUROTH_01",0, "stop", "1")
modbusInterposeConfig("EUROTH_01",1,2000,0)
#Attention! The Names (1st parameter) must be identical with macros when the db-Files are loaded!
#define IN
drvModbusAsynConfigure("PvFloat1", "EUROTH_01", 1, 03, -1, 6, 0, 1000, "EUROTH_01")
#define OUT
drvModbusAsynConfigure("PvFloatout1", "EUROTH_01", 1, 16, -1, 6, 0, 1000, "EUROTH_01")

# Eurotherm 2 replacing OMRON
drvAsynSerialPortConfigure("EUROTH_02","/dev/COM11",0,0,0)
asynSetOption("EUROTH_02",0, "baud", "9600")
asynSetOption("EUROTH_02",0, "bits", "8")
asynSetOption("EUROTH_02",0, "parity", "none")
asynSetOption("EUROTH_02",0, "stop", "1")
modbusInterposeConfig("EUROTH_02",1,2000,0)
#Attention! The Names (1st parameter) must be identical with macros when the db-Files are loaded! 
#define IN
drvModbusAsynConfigure("PvFloat2", "EUROTH_02", 1, 03, -1, 6, 0, 1000, "EUROTH_02")
#define OUT
drvModbusAsynConfigure("PvFloatout2", "EUROTH_02", 1, 16, -1, 6, 0, 1000, "EUROTH_02")

# Bronkhorst MFCs
#FLOW1
drvAsynSerialPortConfigure("COM13","/dev/COM13",0,0,0)
asynSetOption("COM13",0, "baud", "38400")
asynSetOption("COM13",0, "bits", "8")
asynSetOption("COM13",0, "parity", "none")
asynSetOption("COM13",0, "stop", "1")
#FLOW2
drvAsynSerialPortConfigure("COM14","/dev/COM14",0,0,0)
asynSetOption("COM14",0, "baud", "38400")
asynSetOption("COM14",0, "bits", "8")
asynSetOption("COM14",0, "parity", "none")
asynSetOption("COM14",0, "stop", "1")
#FLOW3
drvAsynSerialPortConfigure("COM15","/dev/COM15",0,0,0)
asynSetOption("COM15",0, "baud", "38400")
asynSetOption("COM15",0, "bits", "8")
asynSetOption("COM15",0, "parity", "none")
asynSetOption("COM15",0, "stop", "1")
#FLOW4
drvAsynSerialPortConfigure("COM16","/dev/COM16",0,0,0)
asynSetOption("COM16",0, "baud", "38400")
asynSetOption("COM16",0, "bits", "8")
asynSetOption("COM16",0, "parity", "none")
asynSetOption("COM16",0, "stop", "1")
#FLOW5
drvAsynSerialPortConfigure("COM17","/dev/COM17",0,0,0)
asynSetOption("COM17",0, "baud", "38400")
asynSetOption("COM17",0, "bits", "8")
asynSetOption("COM17",0, "parity", "none")
asynSetOption("COM17",0, "stop", "1")
#Pressurecntrl
drvAsynSerialPortConfigure("COM18","/dev/COM18",0,0,0)
asynSetOption("COM18",0, "baud", "38400")
asynSetOption("COM18",0, "bits", "8")
asynSetOption("COM18",0, "parity", "none")
asynSetOption("COM18",0, "stop", "1")


## Load record instances
#dbLoadRecords("db/xxx.db","user=epics")
#pattern Bronkhorst	: "P=FHIISC, R=REAKTORX, N=NAMEOFDEVICE, I=PORTOFDEVICE"
#examplepattern		: dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW1, I=COM3, U=UNIT, T=NODE")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW1, I=COM13, U=ml/min, T=80")

#dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW2, I=COM14, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW3, I=COM15, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW4, I=COM16, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW5, I=COM17, U=ml/min, T=80")
dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=FLOW6, I=COM17, U=ml/min, T=81")
#dbLoadTemplate("db/Bronkhorst.substitution", "P=FHIISC, R=REAKTOR2, N=PRESSURECTL, I=COM18 , U=bar   , T=80")

#Attention! The Names (I= and O=) must be identical with the names defined in drvModbusAsynConfigure!I=In and O=Out
dbLoadTemplate("db/eurotherm24xx32xx.substitutions", "P=FHIISC, R=REAKTOR2, N=EUROMOD1, I=PvFloat1, O=PvFloatout1")
dbLoadTemplate("db/eurotherm24xx32xx.substitutions", "P=FHIISC, R=REAKTOR2, N=EUROMOD2, I=PvFloat2, O=PvFloatout2")

#pattern Pressuresensor	: "P=FHIISC, R=REAKTORX, N=NAMEOFDEVICE, C=CALC"
#examplepattern			: dbLoadRecords("db/pressure.db","P=FHIISC, R=REAKTOR2, N=PRESSURE0_1, C=A*20")
#Attention! The Name (N=) must be identical with the name defined in drvModbusAsynConfigure! C= is a formula 
dbLoadRecords("db/X418.db","P=FHIISC, R=REAKTOR2, N=PRESSURE0_1, C=A*20")
dbLoadRecords("db/X418.db","P=FHIISC, R=REAKTOR2, N=PRESSURE0_2, C=A*20")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=epics"
