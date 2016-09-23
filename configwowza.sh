#!/bin/bash
#arguments: username, storage account, storage access key, container name
#Install azure CLI for storage 
sudo su
cd /home/$1
sudo apt-get update
sudo apt-get install -y npm
wget http://aka.ms/linux-azure-cli
sudo npm install -g linux-azure-cli
sudo ln -s /usr/bin/nodejs /usr/bin/node
azure telemetry --disable

export USER=$1
export AZURE_STORAGE_ACCOUNT=$2
export AZURE_STORAGE_ACCESS_KEY=$3
export CONTAINER_NAME=$4
export DESTINATION_FOLDER=/usr/local/WowzaStreamingEngine/content/
export EDITOR=vi 

echo "export AZURE_STORAGE_ACCOUNT="$2 >>.profile
echo "export AZURE_STORAGE_ACCESS_KEY="$3 >>.profile



sudo chmod 777 /usr/local/WowzaStreamingEngine/content/
echo "export AZURE_STORAGE_ACCOUNT="$2 >>pollsa.sh
echo "export AZURE_STORAGE_ACCESS_KEY="$3 >>pollsa.sh
echo "azure storage blob list videos" >> pollsa.sh
sudo chmod 777 pollsa.sh

wget https://raw.githubusercontent.com/sysgain/wowzaP2P/master/wowza/scripts/download1.sh
wget https://raw.githubusercontent.com/sysgain/wowzaP2P/master/wowza/scripts/delete.sh
sudo chmod 777 delete.sh
sudo chmod 777 download1.sh

#echo "export USER="$1 >> mycron.txt
#echo "export AZURE_STORAGE_ACCOUNT="$2 >> mycron.txt
#echo "export AZURE_STORAGE_ACCESS_KEY="$3 >> mycron.txt
echo "*/5 * * * * sh /home/"$USER"/download.sh | sh" >> mycron.txt
#echo "*/5 * * * * sh /home/"$USER"/delete.sh | sh" >> mycron.txt
sudo chmod 777 mycron.txt
crontab -l -u $USER | cat - mycron.txt| crontab -u $USER -
sleep 10
service cron restart

#configure admin password
cd /usr/local/WowzaStreamingEngine/conf
sudo chmod 777 admin.password
echo "wowza  Ignite@2016  admin" > admin.password
#configure stream publish password
sudo chmod 777 publish.password
echo "wowza Ignite@2016" > publish.password





