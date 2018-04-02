#!/usr/bin/env bash
#
# Auto hold firefox running
#
# System Required:  Debian 8 x86_64
#
# Author:  Shuokang the Great
#
## Start
#
while :
do
ffpid=`pgrep firefox | wc -l`
if [ $ffpid -eq 0 ];then
	sudo firefox --display=:1
fi
	sleep 30
done