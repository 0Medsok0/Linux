#!/bin/bash

# sistem info journal

# Store all output in an array
output=()
output+=("$(cat /var/log/syslog)") # global journal
output+=("$(cat /var/log/auth.log)") # System information about successful and unsuccessful logins to the system
output+=("$(dmesg)") #  System information about how the upload to the system took place
output+=("$(cat /var/log/apt/history.log)") # Contains the history of executed update, install, uninstall, and other package operations
output+=("$(dmesg -l err)") # We look at a selectively defined level of messages (errors) for the dmesg log
output+=("$(dmesg -l warn)") # We look at a selectively defined level of messages (warnings) for the dmesg log
output+=("$(last)") # Recent user sessions
output+=("$(cat /var/log/alternatives.log)") # Output of the update alternatives program which contains symbolic links to commands or libraries by default
output+=("$(faillog -a)") # Log of failed logins
output+=("$(cat /var/log/dpkg.log)") # 

# Print the whole array
echo "${output[@]}" > jour.txt # выводим весь массив 

sendmail < jour.txt mail@gmail.com # отправляем с помощью sendmail, полученный файл на указанную почту

# Эта строка кода настраивает новое задание cron. Cron - это основанный на времени планировщик заданий в операционных системах на базе Unix.
# Команда "crontab -l" выводит список заданий cron текущего пользователя, а "2>/dev/null" перенаправляет любые сообщения об ошибках в /dev/null, что означает, что ошибки игнорируются.
# Точка с запятой отделяет эту команду от следующей, которая должна повторить новую строку в пользовательском файле crontab.
# Эта строка указывает, что скрипт "journal.sh " должен выполняться в полночь (0 0 * * *) каждый день
# Наконец, вся эта команда передается по конвейеру в "crontab -", чтобы обновить crontab пользователя новым заданием.

(crontab -l 2>/dev/null; echo "0 0 * * * /bin/bash ~/'Рабочий стол'/kod/journal.sh") | crontab -

