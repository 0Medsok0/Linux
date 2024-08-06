#get_data_from_csv: Эта функция читает данные из CSV-файла, используя разделитель (по умолчанию запятую).
#get_data_from_sql: Эта функция извлекает данные из SQLite-базы данных с помощью SQL-запроса.
#generate_csv_report: Эта функция создает CSV-файл с полученными данными, используя разделитель (по умолчанию запятую).
#generate_html_report: Эта функция создает HTML-файл с простым представлением данных в таблице. Она принимает заголовок отчета (по умолчанию "Отчет").

#Основной скрипт:
#Скрипт предлагает пользователю выбрать источник данных (CSV или SQL).
#Затем предлагает выбрать формат отчета (CSV или HTML).
#Вызывает соответствующие функции для получения данных и генерации отчета.

#Как использовать:
#Создайте CSV-файл: Например, 
#с данными, разделенными запятыми.
#Создайте SQLite-базу данных: Например, 
#с таблицей data.
#Запустите скрипт: bash report_generator.sh.

#!/bin/bash

# Функция для получения данных из CSV-файла
get_data_from_csv() {
  local filename="$1"
  local delimiter="$2"  # Разделитель столбцов (по умолчанию запятая)
  if [[ -z "$delimiter" ]]; then
    delimiter=","
  fi
  local data=()
  while IFS="$delimiter" read -r -a line; do
    data+=("$line")
  done < "$filename"
  echo "${data[@]}"
}

# Функция для получения данных из SQL-базы данных
get_data_from_sql() {
  local db_file="$1"
  local query="$2"
  local data=()
  sqlite3 "$db_file" "$query" | while read -r line; do
    data+=("$line")
  done
  echo "${data[@]}"
}

# Функция для генерации отчета в формате CSV
generate_csv_report() {
  local data="$1"
  local output_file="$2"
  local delimiter="$3"  # Разделитель столбцов (по умолчанию запятая)
  if [[ -z "$delimiter" ]]; then
    delimiter=","
  fi
  printf "%s\n" "${data[@]}" | tr ' ' "$delimiter" > "$output_file"
}

# Функция для генерации отчета в формате HTML (простая)
generate_html_report() {
  local data="$1"
  local output_file="$2"
  local header="$3"  # Заголовок отчета (по умолчанию "Отчет")
  if [[ -z "$header" ]]; then
    header="Отчет"
  fi
  echo "<!DOCTYPE html>" > "$output_file"
  echo "<html>" >> "$output_file"
  echo "<head>" >> "$output_file"
  echo "<title>$header</title>" >> "$output_file"
  echo "</head>" >> "$output_file"
  echo "<body>" >> "$output_file"
  echo "<h1>$header</h1>" >> "$output_file"
  echo "<table>" >> "$output_file"
  for line in $data; do
    echo "<tr>" >> "$output_file"
    for item in $line; do
      echo "<td>$item</td>" >> "$output_file"
    done
    echo "</tr>" >> "$output_file"
  done
  echo "</table>" >> "$output_file"
  echo "</body>" >> "$output_file"
  echo "</html>" >> "$output_file"
}

# Основной скрипт
while true; do
  echo "Выберите источник данных:"
  echo "1. CSV-файл"
  echo "2. SQL-база данных"
  echo "3. Выход"

  read -p "Введите номер: " choice

  case "$choice" in
    1)
      read -p "Введите имя CSV-файла: " filename
      read -p "Введите разделитель (по умолчанию запятая): " delimiter
      data=$(get_data_from_csv "$filename" "$delimiter")
      ;;
    2)
      read -p "Введите имя SQL-файла: " db_file
      read -p "Введите SQL-запрос: " query
      data=$(get_data_from_sql "$db_file" "$query")
      ;;
    3)
      exit 0
      ;;
    *)
      echo "Неверный выбор."
      continue
      ;;
  esac

  echo "Выберите формат отчета:"
  echo "1. CSV"
  echo "2. HTML"
  echo "3. Отмена"

  read -p "Введите номер: " choice

  case "$choice" in
    1)
      read -p "Введите имя выходного файла: " output_file
      read -p "Введите разделитель (по умолчанию запятая): " delimiter
      generate_csv_report "$data" "$output_file" "$delimiter"
      echo "Отчет в формате CSV сохранен в файл: $output_file"
      ;;
    2)
      read -p "Введите имя выходного файла: " output_file
      read -p "Введите заголовок отчета (по умолчанию 'Отчет'): " header
      generate_html_report "$data" "$output_file" "$header"
      echo "Отчет в формате HTML сохранен в файл: $output_file"
      ;;
    3)
      continue
      ;;
    *)
      echo "Неверный выбор."
      continue
      ;;
  esac
done
