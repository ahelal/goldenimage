#!/bin/sh
set -ex

## Update
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

## Inst prereq.
sudo apt-get -y install python3-pip git

## Create user that runs e-commerce
sudo useradd e

## Enable systemd service
sudo mv /tmp/ecommerce.service /etc/systemd/system/ecommerce.service
sudo systemctl daemon-reload
sudo systemctl enable ecommerce
sudo systemctl start ecommerce

## Install master branch of Ecommerce
sudo mkdir -p /opt/ecommerce
cd /opt/ecommerce
sudo git clone https://github.com/ahelal/django-ecommerce.git
cd django-ecommerce
sudo pip3 install -r requirements.txt
