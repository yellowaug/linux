#!/bin/bash
echo "进程检查完成"
echo "正在安装依赖包"
#cd /home/gitlab-runner/builds/GzKsKQ9J/0/qinzhiquan/chat/NIM_Web_Demo_H5-master
cd /home/gitlab-runner/builds/GzKsKQ9J/0/qinzhiquan/chat
rm -rf node_modules
rm -rf dist
cnpm install
echo "依赖包安装完成"
echo "编译依赖包"
npm run buildend
echo "正在部署项目"
systemctl stop nginx
rm -rf /home/gitlab-runner/project/chat/*
cp -rf ./dist /home/gitlab-runner/project/chat
cp -f ./index.html /home/gitlab-runner/project/chat
cp -f ./login.html /home/gitlab-runner/project/chat
cp -f ./regist.html /home/gitlab-runner/project/chat
systemctl start nginx


