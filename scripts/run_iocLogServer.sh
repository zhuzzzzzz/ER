#!/bin/bash

script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)

export EPICS_IOC_LOG_FILE_NAME=${script_dir}/../log/iocLog/iocLog.log
echo "Do not close, Running iocLogServer..."
iocLogServer
