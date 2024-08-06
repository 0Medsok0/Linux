#!/bin/bash

# Анализ запущенных процессов

while true; do
  ps aux | awk '{print $2 " " $11}' | while read pid command; do
    echo "PID: $pid, Command: $command"
  done
  sleep 5 # Проверяем каждые 5 секунд
done
