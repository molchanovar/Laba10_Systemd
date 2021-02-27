# Установка spawn-fcgi
yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
# Раскомментирование конфиг-файла /etc/sysconfig/spawn-fcgi
sed -i 's/#SOCKET/SOCKET/' /etc/sysconfig/spawn-fcgi
sed -i 's/#OPTIONS/OPTIONS/' /etc/sysconfig/spawn-fcgi
# Добавление юнита 
cp /vagrant/provision/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service
# Включение и запуск
systemctl daemon-reload
systemctl enable spawn-fcgi
systemctl start spawn-fcgi
