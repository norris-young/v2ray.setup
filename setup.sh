#!/bin/bash

curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh > install.v2ray.sh

curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh > install.v2ray.dat.sh

chmod +x install.v2ray.sh install.v2ray.dat.sh
./install.v2ray.sh
./install.v2ray.dat.sh

cp tcp.template.json /usr/local/etc/v2ray/config.json
newid=$(cat /proc/sys/kernel/random/uuid)
re="s/\"id\": \"\\S+\"/\"id\": \"${newid}\"/g"
sed -i -r ${re} /usr/local/etc/v2ray/config.json
service v2ray start
echo "v2ray start!"
echo "new uuid:"
echo "${newid}"
