#!/bin/sh
read -p "请输入应用程序名称:" appname
read -p "请设置你的容器内存大小(默认256):" ramsize
if [ -z "$ramsize" ];then
	ramsize=256
fi
cd get-started-python
wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d v2ray1 v2ray-linux-64.zip
cd v2ray1
chmod 777 *
cd ..
rm -rf v2ray-linux-64.zip
mv ~/get-started-python/v2ray1/v2ray ~/get-started-python/vray
mv ~/get-started-python/v2ray1/v2ctl ~/get-started-python/vctl
rm -rf ~/get-started-python/v2ray1
uuid=`cat /proc/sys/kernel/random/uuid`
path=`echo $uuid | cut -f1 -d'-'`
echo '###############################'>>~/get-started-python/cconfig.json
echo '{"inbounds":[{"protocol":"vmess","port":8080,"settings":{"clients":[{"id":"'$uuid'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$path'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}'>>~/get-started-python/cconfig.json
echo UUID: $uuid
echo path: /$path
echo vmess://$vmess
