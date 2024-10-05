#!/bin/bash

sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list && apt update && apt upgrade

pkg install openssl wget htop tsu proot git nano neofetch python curl cmake esbuild

apt update && apt upgrade

git clone https://gitclone.com/github.com/SillyTavern/SillyTavern

cd SillyTavern

pkg install nodejs

npm config set registry https://registry.npmmirror.com

npm install
