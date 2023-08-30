#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv E162F504A20CDF15827F718D4B7C549A058F8B6B
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
echo "deb http://repo.pritunl.com/stable/apt focal main" | tee /etc/apt/sources.list.d/pritunl.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc | sudo apt-key add -
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
apt update
apt -y install wireguard wireguard-tools
ufw disable
apt -y install pritunl mongodb-org
systemctl enable mongod pritunl
systemctl start mongod pritunl
