#!/bin/bash

if [ X$1 = X ]; then
        read -p "请输入镜像版本号(按回车默认latest)：" version
else
        version=$1
fi

if [ X$version = X ]; then
version=latest
fi

echo -e "\n"
echo "------------------------"
echo "镜像版本为：$version"
echo "------------------------"


mvn -DskipTests=true package docker:build &&

docker tag winterchen/My-Site-Plus:latest winterchen/My-Site-Plus:$version &&

docker push winterchen/My-Site-Plus:$version
echo "[上传完成]"
