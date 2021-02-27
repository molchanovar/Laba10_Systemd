#!/bin/bash

# Копируем файлы
cp /vagrant/task1/watchlog /etc/sysconfig/
cp /vagrant/task1/watchlog.log /var/log/
cp /vagrant/task1/watchlog.sh /opt/ 
chmod +x /opt/watchlog.sh
# решение проблемы с /bin/bash^M: bad interpreter: No such file or directory
sed -i -e 's/\r$//' /opt/watchlog.sh
cp /vagrant/task1/watchlog.service /etc/systemd/system/
cp /vagrant/task1/watchlog.timer /etc/systemd/system/

# Запуск сервиса 
systemctl daemon-reload
systemctl enable watchlog.timer
systemctl enable watchlog.service
systemctl start watchlog.timer
systemctl start watchlog.service
