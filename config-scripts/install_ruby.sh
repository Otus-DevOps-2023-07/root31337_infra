#!/bin/bash
# Run this script with sudo
echo "Install Ruby & Bundler"
sudo apt update && sudo apt install -y ruby-full ruby-bundler build-essential
echo " "
echo "View versions of ruby and bundler"
ruby -v
