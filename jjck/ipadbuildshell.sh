#! /bin/bash
# 这个是Ipad端的发布脚本
echo "开始配置正式服配置文件"
cp -rf /home/hostconfig/ipad/.env* /home/gitlab-runner/builds/ar41oxPj/0/mnmqianduan/muniumaweb/ipad
cp -rf /home/hostconfig/ipad/request.js /home/gitlab-runner/builds/ar41oxPj/0/mnmqianduan/muniumaweb/ipad/src/utils
cp -rf /home/hostconfig/ipad/state.js /home/gitlab-runner/builds/ar41oxPj/0/mnmqianduan/muniumaweb/ipad/src/store
cp -rf /home/hostconfig/ipad/upload.js /home/gitlab-runner/builds/ar41oxPj/0/mnmqianduan/muniumaweb/ipad/src/api
echo "开始运行构建脚本"
cd /home/gitlab-runner/builds/ar41oxPj/0/mnmqianduan/muniumaweb/ipad
echo "运行 npm install"
npm install
echo "运行 npm run build"
npm run build
echo "停止nginx"
systemctl stop nginx
echo "复制网站内容到nginx"
cp -rf dist/* /home/publicwebsite/ipad
echo "启动nginx"
systemctl start nginx
echo "构建脚本运行结束"