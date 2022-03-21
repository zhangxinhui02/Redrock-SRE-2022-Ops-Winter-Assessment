#!/bin/bash
# -*- coding: utf-8 -*-
# 此脚本将安装DDNS脚本到Linux操作系统中
# https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/blob/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/

# 配置代理
# 配置为true即可启用代理
USE_HTTPS_PROXY=false
# 代理服务器地址及端口
ADDRESS=http://127.0.0.1:7890

# 安装路径
INSTALL_PATH="/usr/local/ddns_script"
BIN_PATH="/usr/local/bin"
SERVICE_PATH="/etc/systemd/system/"


if [ ! -d $INSTALL_PATH ]
then mkdir $INSTALL_PATH
fi

cd $INSTALL_PATH || exit
if [ $USE_HTTPS_PROXY == "true" ]; then
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/requirements.txt
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/ddns.py
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/ddns_script.py
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/aliyun_dns_manager.py
else
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/requirements.txt
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/ddns.py
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/ddns_script.py
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/aliyun_dns_manager.py
fi
pip3 install -r requirements.txt || pip install -r requirements.txt


cd $BIN_PATH || exit
if [ $USE_HTTPS_PROXY == "true" ]; then
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/ddns
else
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/ddns
fi
chmod +x ddns


cd $SERVICE_PATH || exit
if [ $USE_HTTPS_PROXY == "true" ]; then
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/ddns.service
  wget -e "https_proxy=$ADDRESS" https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/ddns.timer
else
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/ddns.service
  wget https://github.com/zhangxinhui02/Redrock-SRE-2022-Ops-Winter-Assessment/raw/master/Q2/2021214721%E5%BC%A0%E9%91%AB%E8%BE%89/DDNS_Script/install_files/ddns.timer
fi
systemctl enable ddns.timer
systemctl start ddns.timer


ddns
