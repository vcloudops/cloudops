#!/bin/bash
Usage(){
    echo "This script is to setup password-less ssh login from current host to a given remote host."
}

echo $(date) " - Starting Script"


PASSWORD=$1
PrivateIP=$2

echo $PASSWORD >> /tmp/log
echo $PrivateIP >> /tmp/log
