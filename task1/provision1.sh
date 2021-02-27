#!/bin/bash

cp /vagrant/provision/watchlog /etc/sysconfig/
cp /vagrant/provision/watchlog.log /var/log/
cp /vagrant/provision/watchlog.sh /opt/ 
chmod +x /opt/watchlog.sh
cp /vagrant/provision/watchlog.service /etc/systemd/system/
cp /vagrant/provision/watchlog.timer /etc/systemd/system/

systemctl daemon-reload
systemctl enable watchlog.timer
systemctl enable watchlog.service
systemctl start watchlog.timer
systemctl start watchlog.service
