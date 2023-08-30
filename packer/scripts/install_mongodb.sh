#!/bin/bash
# Run this script with sudo
echo "Install MongoDB"
sudo apt update && sudo apt install -y mongodb
sleep 10
echo "Start and enable MongoDB"
sudo systemctl start mongodb
sudo systemctl enable mongodb
echo "view mongoDB"
sleep 10
sudo systemctl status mongodb
