#!/bin/bash
process=`cat process.txt`
PID=`ps -aux | grep -i ${process} | awk '{print $2}'`
kill -9 $PID >/dev/null 2>&1
> process.txt
