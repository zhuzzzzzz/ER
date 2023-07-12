#!../../bin/linux-x86_64/Status_OS

#- You may have to change Status_OS to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/Status_OS.dbd"
Status_OS_registerRecordDeviceDriver pdbbase

#caPutLog
asSetFilename("${TOP}/$(IOC).acf")
epicsEnvSet("EPICS_IOC_LOG_INET","127.0.0.1")
iocLogPrefix("${IOC} ")
iocLogInit()

#autosave
epicsEnvSet SAVE_DIR ${TOP}/../../log/autosave/$(IOC)
set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")
#set_pass1_restoreFile("$(IOC).sav")
set_pass1_restoreFile("$(IOC)-automake.sav")
save_restoreSet_DatedBackupFiles(1)
save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(600)
save_restoreSet_RetrySeconds(60)
save_restoreSet_CallbackTimeout(-1)

#

## Load record instances
#dbLoadRecords("db/Status_OS.db","user=zhu")
dbLoadRecords("db/status_OS.db","HOST=zhu-VirtualBox")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=zhu"

#caPutLog after iocInit
caPutLogInit "127.0.0.1:7004" 0

#autosave after iocInit
#create_monitor_set("${IOC}.req",10)
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/${IOC}-automake.req", "autosaveFields_pass0")
create_monitor_set("${IOC}-automake.req",10)
