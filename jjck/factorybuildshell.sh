#! /bin/bash
# 这个是工厂factory端的发布脚本

echo "开始运行构建脚本"
cd /home/gitlab-runner/builds/JKQ8p6j5/0/mnmqianduan/muniumaweb/factory
echo "运行 npm install"
npm install
echo "运行 npm run build"
npm run build
echo "停止nginx"
systemctl stop nginx
echo "复制网站内容到nginx"
cp -rf dist/* /home/gitlab-runner/project/factory
echo "启动nginx"
systemctl start nginx
echo "构建脚本运行结束"