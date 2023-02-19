#!/bin/bash

netstat -nlpt | grep ":7777" | awk '{print $7}' | awk -F"/" '{print $1}' | xargs kill -9
yum -y install google-chrome
python3.7 main.py
if [ $? -ne 0 ];then
    echo "main启动失败,请验证"
fi
