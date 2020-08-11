#! /bin/bash
# 这个是Ipad端的发布脚本

echo "开始运行构建脚本"
cd /home/gitlab/Z6b9Qc4r/0/mnmqianduan/muniumaweb/ipad
npm install
npm run build
systemctl stop nginx
cp -ri dist/* /home/gitlab-runner/project/ipad
systemctl start nginx
echo "构建脚本运行结束"