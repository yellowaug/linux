#! /bin/bash
# 这个是平台platform端的发布脚本
echo "开始配置正式服务器配置文件"
cp -rf /home/hostconfig/platform/* /home/gitlab-runner/builds/AvosHvWw/0/mnmqianduan/muniumaweb/platform/config
echo "开始运行构建脚本"
cd /home/gitlab-runner/builds/AvosHvWw/0/mnmqianduan/muniumaweb/platform
echo "运行 npm install"
npm install
echo "运行 npm run build"
npm run build:prod
echo "停止nginx"
systemctl stop nginx
echo "复制网站内容到nginx"
cp -rf dist/* /home/publicwebsite/platform
echo "启动nginx"
systemctl start nginx
echo "构建脚本运行结束"