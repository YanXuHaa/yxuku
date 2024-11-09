#!/bin/bash


clear


echo " "
echo "语句库来自：“https://hitokoto.cn/”"
echo "脚本&代码编写：1tt1e_1219"
echo "对语句库中任何内容可能冒犯的内容不作保证。"
echo " "
echo " "
echo " "


read -p "请输入'y'确认安装，或输入'n'取消安装: " confirm


case "$confirm" in
  y|Y)
    echo "少女祈祷中....."

    
    echo -n "下载中 [."
    download() {
      rm -rf yxuku
      cd "$HOME" &> /dev/null
      git clone https://github.com/YanXuHaa/yxuku.git &> /dev/null
    }
    if download; then
      echo -n "."
      echo -n ".]"
      echo "下载完成"
    else
      echo "下载失败"
      exit 1
    fi

    
    echo -n "安装中 [."
    install() {
      cd "$HOME/yxuku" &> /dev/null
      cp -r meiri "$HOME/" &> /dev/null
      cd "$HOME/meiri" &> /dev/null
      chmod +x run_main.sh &> /dev/null
      echo -e "\n./meiri/run_main.sh" >> ~/.bashrc
    }
    if install; then
      echo -n "."
      echo -n ".]"
      echo "安装完成"
    else
      echo "安装失败"
      exit 1
    fi

    
    echo -n "清理中 [."
    cleanup() {
      cd "$HOME" &> /dev/null
      rm -rf yxuku &> /dev/null
    }
    if cleanup; then
      echo -n "."
      echo -n ".]"  
      echo "清理完成"
    else
      echo "清理失败"
      exit 1
    fi

    
    echo "安装完成"
    ;;
  n|N)
    echo "安装已取消。"
    ;;
  *)
    echo "输入无效，请输入'y'或'n'。"
    exit 1
    ;;
esac