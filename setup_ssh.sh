 
#!/bin/bash

# Проверяем количество переданных аргументов
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <Host> <Hostname>"
    exit 1
fi

HOST=$1
HOSTNAME=$2
SSH_DIR="$HOME/.ssh"
CONFIG="$SSH_DIR/config"
KEY="$SSH_DIR/$HOST"

# Создаем директорию .ssh, если она не существует
mkdir -p "$SSH_DIR"

# Проверяем существует ли файл config и создаем его, если нет
if [ ! -f "$CONFIG" ]; then
    echo "" > "$CONFIG"
fi

# Генерируем SSH ключ, если он не существует
if [ ! -f "$KEY" ]; then
    ssh-keygen -t rsa -C "gritsatsuev.pavel@gmail.com" -f "$KEY" -N ""
    echo "SSH key generated at $KEY"
fi

# Добавляем новую конфигурацию в файл config
echo -e "Host $HOST\n    Hostname $HOSTNAME\n    IdentityFile=$KEY" >> "$CONFIG"
echo "Config entry added for $HOST"

# Отображение результата конфигурации
echo "Current SSH configuration for $HOST:"
grep -A 2 "Host $HOST" "$CONFIG"
cat "$KEY.pub"
