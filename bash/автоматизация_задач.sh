#!/bin/bash

# Проверка аргументов
if [ $# -lt 1 ]; then
  echo "Необходимо указать имя задачи."
  exit 1
fi

# Задача
case "$1" in
  update)
    echo "Обновление системы..."
    sudo apt update && sudo apt upgrade -y
    ;;
  patch)
    echo "Установка патчей..."
    sudo apt update && sudo apt install --reinstall $(apt list --installed | grep -v '^ ' | awk '{print $1}')
    ;;
  update-get)
    echo "Обновление системы..."
    sudo apt-get update && sudo apt-get upgrade -y
    ;;
  *)
    echo "Неизвестная задача."
    exit 1
    ;;
esac
