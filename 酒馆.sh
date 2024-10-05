#!/bin/bash

sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list && apt update && apt upgrade

pkg install -y openssl wget htop tsu proot git nano neofetch python curl cmake esbuild

pkg update && pkg upgrade && apt update -y && apt upgrade -y

git clone https://gitclone.com/github.com/SillyTavern/SillyTavern

cd SillyTavern

pkg install -y nodejs

npm config set registry https://registry.npmmirror.com

npm install
