#!../../bin/linux-x86_64/julaboCP450

#- You may have to change julaboCP450 to something else
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
dbLoadDatabase "dbd/julaboCP450.dbd"
julaboCP450_registerRecordDeviceDriver pdbbase

#Chiller
drvAsynSerialPortConfigure("COM2","/dev/COM2",0,0,0)
asynSetOption("COM2",0, "baud", "4800")
asynSetOption("COM2",0, "bits", "7")#7?
asynSetOption("COM2",0, "parity", "even")
asynSetOption("COM2",0, "stop", "1")


dbLoadTemplate("db/julaboCP450.substitution", "P=FHIISC, R=JULABO, N=COOLER, I=COM2, T=CP450")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=epics"
