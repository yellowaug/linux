#!/bin/bash
# echo "Input process name first"
# read input1
echo "正在检查node服务器进程"
PID=$(ps x | grep node | grep -v grep | awk '{print $1}')

if [ $? -eq 0 ]; then
    echo "process id:$PID"
else
    echo "process node not exit"
fi

echo "kill process"
kill -9 ${PID}

if [ $? -eq 0 ];then
    echo "kill node success"
else
    echo "kill node fail"
fi
echo "进程检查完成"
echo "正在安装依赖包"
#cd /home/gitlab-runner/builds/GzKsKQ9J/0/qinzhiquan/chat/NIM_Web_Demo_H5-master
npm install
echo "依赖包安装完成"
echo "运行服务"
npm run server &

