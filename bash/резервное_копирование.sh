#!/bin/bash

# Исходный каталог для резервной копии
SOURCE="/path/to/your/data"

# Целевой каталог для резервной копии
DESTINATION="/path/to/backup/directory"

# Целевой каталог
mkdir -p "$DESTINATION"

# Создаем резервную копию 
tar -czvf "$DESTINATION/backup-$(date +%Y-%m-%d_%H-%M-%S).tar.gz" "$SOURCE"

echo "Backup created successfully!"
