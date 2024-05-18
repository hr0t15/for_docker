#!/bin/bash

################################################################
# Docker のインストール
################################################################

# Dockerを導入するために必要となるパッケージをインストール
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 公式DockerリポジトリのGPGキーをシステムに追加し、DockerリポジトリをAPTソースに追加
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

# Dockerをインストールする。
sudo apt install -y docker-ce

# sudoなしでDocker実行できるようにするために、dockerグループに追加する。
sudo gpasswd -a $(whoami) docker
getent group docker

# Dockerがインストールされたことを確認する。
docker version

# Dockerのサービスの有効化
sudo systemctl enable docker


################################################################
# Docker Compose のインストール
################################################################

# Docker のリポジトリからDocker Composeをインストール
sudo apt install docker-compose-plugin

# Docker Composeがインストールされたことを確認する。
docker compose version
