#!/bin/bash
sudo usermod -d /var/lib/mysql/ mysql
sudo ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock
sudo chown -R mysql:mysql /var/lib/mysql
sudo service mysql start
sudo python3 manage.py runserver 0.0.0.0:8080
