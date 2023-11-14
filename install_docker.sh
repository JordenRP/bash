
#!/bin/bash

# Обновление списка пакетов
sudo apt update

# Установка необходимых зависимостей
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Добавление GPG ключа для репозитория Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Добавление репозитория Docker в APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Обновление списка пакетов после добавления репозитория Docker
sudo apt update

# Установка Docker
sudo apt install docker-ce -y

# Проверка запуска Docker
sudo systemctl status docker

sudo usermod -aG docker $USER
