#!/bin/bash
if [ "$2" = "-w" ] && [ "$4" = "-c" ]; then
logtime=`date -r $1 +%Y%m%d%H%M%S`
systime=`date +%Y%m%d%H%M%S`
display=`date -r $1`
result=$(($systime-$logtime))

if [ $result -gt $(($5*100)) ]; then
echo "Critical - Last log created at $display"
exit 2
elif [ $result -gt $(($3*100)) ]; then
echo "Warning - Last log created at $display"
exit 1
else echo "OK - Last log created at $display" 
exit 0
fi
fi