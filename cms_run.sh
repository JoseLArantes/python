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
