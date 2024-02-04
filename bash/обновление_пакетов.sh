#!/bin/bash
if [ $(id -u) -eq 0 ]; then
    apt update
    apt upgrade -y
    apt autoremove -y
    apt autoclean
fi
