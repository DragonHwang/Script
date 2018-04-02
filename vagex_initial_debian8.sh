#!/usr/bin/env bash
#
# Auto install Vagex
#
# System Required:  Debian 8 x86_64
#
# Author:  Shuokang the Great
#
## Start
#
sudo apt-get update -y
sudo apt-get install xfce4 -y
sudo apt-get install vnc4server -y
sudo apt-get install iceweasel -y
sudo apt-get install psmisc -y
#
## Setup
#
sudo vnc4server
sudo vnc4server -kill :1
sudo sed -i '$a startxfce4 &' /root/.vnc/xstartup
sudo chmod +x /root/.vnc/xstartup