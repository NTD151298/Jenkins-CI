#!/bin/bash

# bash /home/duongnt01/Personal-project-Devops/Jenkins-CI/key/createkey.sh
# Tạo các thư mục
sudo mkdir -p key/key

# Tạo các tệp khóa
sudo ssh-keygen -t rsa -b 2048 -f key/key5 -N ""

# Đổi tên cho cái tệp key
sudo mv key/key5 key/key5.pem

# Thiết lập quyền cho các tệp khóa
sudo chmod 400 key/key5.pem

# Đổi chủ sở hữu cho người dùng chính Dương
sudo chown duongnt01:duongnt01 key/key5.pem
