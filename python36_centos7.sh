#!/usr/bin/env bash
#
# Auto install Python3.6 and its relative tools
#
# System Required: CentOS 7 x86_64
#
# Author: Shuokang the Great
#
## Make sure run as root
if [ `id -u` -ne 0 ]; then
	echo "Please run as root!"
	exit
fi
#
## Confirmation
echo
read -p "Install Python3.6 and its relative tools now? [y/n]" confirm
if [[ ${confirm} == "n" || ${confirm} == "N" ]]; then
    exit
fi
#
## Install relative libraries
yum install yum-utils
yum-builddep python
#
## Download the source code and install
cd
wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz
tar -zxvf Python-3.6.4.tgz
cd Python-3.6.4
read -p "Do you want to compile with optimizations? [y/n]" optimizations
if [[ ${optimizations} == "y" || ${optimizations} == "Y" ]]; then
    ./configure --prefix=/usr/local/python3 --enable-optimizations
else
	./configure --prefix=/usr/local/python3
fi
make
make altinstall
ln -s /usr/local/python3/bin/python3.6 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3.6 /usr/bin/pip3
ln -s /usr/local/python3/bin/idle3.6 /usr/bin/idle3
