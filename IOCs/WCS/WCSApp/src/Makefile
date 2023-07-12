TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = WCS
# WCS.dbd will be created and installed
DBD += WCS.dbd

# WCS.dbd will be made up from these files:
WCS_DBD += base.dbd

# Include dbd files from all support applications:
#WCS_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#WCS_LIBS += xxx

#################################################
# pva-QSRV
ifdef EPICS_QSRV_MAJOR_VERSION
    WCS_LIBS += qsrv
    WCS_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    WCS_DBD += PVAServerRegister.dbd
    WCS_DBD += qsrv.dbd
endif

# caPutLog
WCS_LIBS += caPutLog
WCS_DBD += caPutLog.dbd
WCS_DBD += caPutJsonLog.dbd

# autosave
WCS_LIBS += autosave
WCS_DBD += asSupport.dbd

# devIocStats
WCS_LIBS += devIocStats
WCS_DBD += devIocStats.dbd



#################################################

# WCS_registerRecordDeviceDriver.cpp derives from WCS.dbd
WCS_SRCS += WCS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
WCS_SRCS_DEFAULT += WCSMain.cpp
WCS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#WCS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
WCS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

