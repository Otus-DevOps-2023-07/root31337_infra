#!/bin/bash
#Deploy test reddit app
reddit_app_dir="reddit"
echo "This script run as user $USER"
cd ~
echo "Check repo for reddit-app"
if [ -d $reddit_app_dir ]
then
  echo "Directory $reddit_app_dir exist! Check repo"
  cd $reddit_app_dir
  git status
  git branch
else
  echo "Clone app-reddit repository"
  git clone -b monolith https://github.com/express42/reddit.git
  echo "Install reddit app"
  cd $reddit_app_dir && bundle install
fi
echo "Check app running"
pid_app=$(ps aux | grep puma | grep -v grep | awk '{print $2}')
if [ -z $pid_app ]
then
  echo "Start service"
  puma -d
  ps aux | grep puma | grep -v grep | awk '{print "Service runnig with PID:",$2}'
else
  echo "Service already running with PID: $pid_app"
fi
