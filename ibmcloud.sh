#!/bin/sh
#read -p "请设置你的容器内存大小(默认256):" ramsize
#if [ -z "$ramsize" ];then
#	ramsize=256
cd $HOME/get-started-python
wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d v2ray1 v2ray-linux-64.zip
cd v2ray1
chmod 777 *
cd ..
rm -rf v2ray-linux-64.zip
mv $HOME/get-started-python/v2ray1/v2ray $HOME/get-started-python/vray
mv $HOME/get-started-python/v2ray1/v2ctl $HOME/get-started-python/v2ctl
rm -rf $HOME/get-started-python/v2ray1
uuid=`cat /proc/sys/kernel/random/uuid`
path=`echo $uuid | cut -f1 -d'-'`
echo '{"inbounds":[{"port":8080,"protocol":"vmess","settings":{"clients":[{"id":"'$uuid'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$path'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}'>$HOME/get-started-python/config.json
#ibmcloud target --cf
#ibmcloud cf push
#domain=`ibmcloud cf app GetStartedPython | grep routes | cut -f2 -d':' | sed 's/ //g'`
#vmess=`echo '{"add":"'$domain'","aid":"64","host":"","id":"'$uuid'","net":"ws","path":"/'$path'","port":"443","ps":"IBM_Cloud","tls":"tls","type":"none","v":"2"}' | base64 -w 0`
#cd ..
#echo 地址: $domain
echo UUID: $uuid
echo path: /$path
echo vmess://$vmess
./v2ctl  config config.json>c.pb
tar -cpvf config.tar c.pb
rm config.json
rm c.pb
rm v2ctl
