#!/bin/bash
# Run this script with sudo
echo "Install MongoDB"
sudo apt update && sudo apt install -y mongodb
echo "Start and enable MongoDB"
sudo systemctl start mongod
sudo systemctl enable mongod
echo "view mongoDB"
sudo systemctl status mongod
