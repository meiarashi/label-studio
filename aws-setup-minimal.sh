#!/bin/bash

# AWSのEC2インスタンスでLabel Studioを設定・起動するためのシンプルなスクリプト

# システムのアップデート
sudo yum update -y

# Dockerのインストール
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker

# Docker Composeのインストール
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 環境変数の設定 - パブリックIPアドレスを自動検出して設定
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
echo "LABEL_STUDIO_HOST=http://$PUBLIC_IP" > .env

# プロジェクトの起動
docker-compose up -d

echo "============================"
echo "Label Studio is now running at http://$PUBLIC_IP"
echo "============================"
