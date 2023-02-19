#!/bin/bash


#远程上传工具
yum -y install lrzsz
#鼠标触控工具
sudo yum -y install xdotool
echo "export DISPLAY=:0.0" >>/etc/profile
source /etc/profile

unzip openai.zip
#部署Python环境，需3.7版本以上
tar -zxvf python3.7.tar.gz
mv python3.7 /usr/local/

#链接Python3.7
ln -s /usr/local/python3.7/bin/python3 /usr/bin/python3.7
ln -s /usr/local/python3.7/bin/pip3 /usr/bin/pip3.7

#更新配置依赖环境
pip3.7 install revChatGPT
pip3.7 install -r requirements.txt

#更新谷歌依赖，最新版109版本以上！否则main.py可能将无法正常运行
yum -y install google-chrome

#部署可视化的界面,谷歌框架
yum -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum -y groupinstall "X Window System"
yum -y groupinstall "Gnome"
pip3.7  install selenium
pip3.7  install undetected_chromedriver
unzip chromedriver_linux64.zip
mv chromedriver /usr/bin/

#安装go-cqhttp QQ机器人框架
tar -zxvf go-cqhttp_linux_amd64.tar.gz
chmod +x go-cqhttp
#./go-cqhttp  选择 0 HTTP通信，目录会生层 config.yml
# cat config.ymls > config.yml  配置文件覆盖掉

#可视化界面
init 3
#startx


