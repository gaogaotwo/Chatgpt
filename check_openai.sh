#!/bin/bash

#更新谷歌框架
yum -y install google-chrome
#谷歌崩溃情况
google=$(ps -ef | grep "/opt/google/chrome" | awk '{print $2}' | wc -l)

if [ $google -gt 1 ];then
    #清除谷歌进程，重启openai服务
    netstat -nlpt | grep ":7777" | awk '{print $7}' | awk -F"/" '{print $1}' | xargs kill -9
    ps -ef | grep "/opt/google/chrome" | awk '{print $2}' | sort | uniq | xarge kill -9
    python3.7 /root/openai/openai/main.py
    if [ $? -ne 0 ];then
        echo "main启动失败,请验证"
    fi
fi

echo "chatgpt正常状态！"
