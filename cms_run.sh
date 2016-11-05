#!/bin/bash
sudo yum -y update
sudo yum -y upgrade
sudo yum -y install postgresql-libs python27-devel python27-psycopg2 postgresql95-devel gcc libxml2-devel libxslt-devel libxml2-devel libxslt-devel patch libtool libffi libffi-devel ncurses-devel git
sudo pip install --upgrade pip
sudo ln -s /usr/local/bin/pip /usr/bin/
sudo pip install virtualenvwrapper
sudo ln -s /usr/local/bin/virtualenvwrapper.sh /usr/bin/
sudo mkdir -p /var/app/
sudo chown ec2-user: /var/app
cd /var/app/
mkvirtualenv portaldaindustria
deactivate
sudo mv /.virtualenvs /home/ec2-user
sudo chown ec2-user: /home/ec2-user/.virtualenvs -R
source virtualenvwrapper.sh
workon portaldaindustria
pip install --upgrade pip
pip install -r https://raw.githubusercontent.com/JoseLArantes/python/master/cmsrequirements.txt

sudo mkdir -p /etc/uwsgi/apps-enabled
cd /etc/uwsgi/apps-enabled
sudo wget https://raw.githubusercontent.com/JoseLArantes/python/master/cms.ini

cd /etc/init.d
sudo wget https://raw.githubusercontent.com/JoseLArantes/python/master/uwsgi

sudo chmod +x uwsgi
sudo ln -s /usr/local/bin/uwsgi /usr/bin/
sudo mkdir -p /var/app/nginx/nginx_temp
sudo mkdir -p /var/app/nginx/nginx_cache
sudo chown nginx: /var/app/nginx -R
cd /etc/nginx
sudo mv nginx.conf nginx.conf.bkp
sudo wget https://raw.githubusercontent.com/JoseLArantes/python/master/nginx.conf
cd conf.d/
wget sudo wget https://raw.githubusercontent.com/JoseLArantes/python/master/cms.nginx.conf
sudo rm -rf virtual.conf
sudo chkconfig nginx on
sudo chkconfig uwsgi on
