#!/bin/bash

# Данный скрипт на bash, ищет наибольший общий делитель (НОД, greatest common divisor, GCD)
# двух чисел. При запуске скрипт ждет ввода двух натуральных чисел через пробел (используем read и указать ему две переменные)
# После ввода чисел скрипт считает их НОД и выводит на экран сообщение "GCD is <посчитанное значение>", например, для чисел 15 и 25 это будет "GCD is 5".
# После этого скрипт опять входит в режим ожидания двух натуральных чисел. Если в какой-то момент работы пользователь ввел вместо этого пустую строку, то скрипт выведет на экран "bye" и закончить свою работу. 

function gcd {
	M=$1
	N=$2
	if ((M == N)); then
		echo "GCD is $M"
	elif ((M > N)); then
		gcd $(($M - $N)) $N
	else
		gcd $M $(($N - $M))
	fi
}

while true; do
	read -p "Enter two natural numbers separated by a space: " num1 num2
	if [ -z "$num1" ] || [ -z "$num2" ]; then
		echo "bye"
		break
	else
		gcd $num1 $num2
	fi
done