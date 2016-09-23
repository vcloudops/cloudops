#!/bin/bash
for i in `sh pollsa.sh | grep mp4 | sed 's/    /;/g' | awk -F";" '{print $2}' | sed 's/B.*//'`
do
echo "file in stoage account is $i"
azure storage blob download videos "$i" /usr/local/WowzaStreamingEngine/content/$i
#echo $result
done
