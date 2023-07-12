TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = Status_OS
# Status_OS.dbd will be created and installed
DBD += Status_OS.dbd

# Status_OS.dbd will be made up from these files:
Status_OS_DBD += base.dbd

# Include dbd files from all support applications:
#Status_OS_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#Status_OS_LIBS += xxx

#################################################
# pva-QSRV
ifdef EPICS_QSRV_MAJOR_VERSION
    Status_OS_LIBS += qsrv
    Status_OS_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    Status_OS_DBD += PVAServerRegister.dbd
    Status_OS_DBD += qsrv.dbd
endif

# caPutLog
Status_OS_LIBS += caPutLog
Status_OS_DBD += caPutLog.dbd
Status_OS_DBD += caPutJsonLog.dbd

# autosave
Status_OS_LIBS += autosave
Status_OS_DBD += asSupport.dbd

# devIocStats
Status_OS_LIBS += devIocStats
Status_OS_DBD += devIocStats.dbd



#################################################

# Status_OS_registerRecordDeviceDriver.cpp derives from Status_OS.dbd
Status_OS_SRCS += Status_OS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
Status_OS_SRCS_DEFAULT += Status_OSMain.cpp
Status_OS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#Status_OS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
Status_OS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

