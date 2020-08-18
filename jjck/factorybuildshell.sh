#! /bin/bash
# 这个是工厂factory端的发布脚本
echo "开始配置正式服务器配置文件"
cp -rf /home/hostconfig/factory/request.js /home/gitlab-runner/builds/AvosHvWw/0/mnmqianduan/muniumaweb/factory/src/utils
cp -rf /home/hostconfig/factory/variable.js /home/gitlab-runner/builds/AvosHvWw/0/mnmqianduan/muniumaweb/factory/src/api
echo "开始运行构建脚本"
cd /home/gitlab-runner/builds/AvosHvWw/0/mnmqianduan/muniumaweb/factory
echo "运行 npm install"
npm install --build-from-source
echo "运行 npm run build"
npm run build
echo "停止nginx"
systemctl stop nginx
echo "复制网站内容到nginx"
cp -rf dist/* /home/publicwebsite/factory
echo "启动nginx"
systemctl start nginx
echo "构建脚本运行结束"