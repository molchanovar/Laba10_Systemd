# Копируем шаблон юнита
cp /usr/lib/systemd/system/httpd.service /etc/systemd/system/httpd@.service

# Добавляем параметр для запуска нескольких экземпляров 
sed -i '/^EnvironmentFile/ s/$/-%I/' /etc/systemd/system/httpd@.service
echo "OPTIONS=-f conf/httpd-first.conf" > /etc/sysconfig/httpd-first
echo "OPTIONS=-f conf/httpd-second.conf" > /etc/sysconfig/httpd-second
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd-first.conf
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd-second.conf
mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.OLD
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd-second.conf
sed -i '/ServerRoot "\/etc\/httpd"/a PidFile \/var\/run\/httpd-second.pid' /etc/httpd/conf/httpd-second.conf

# Запуск
systemctl disable httpd
systemctl daemon-reload
systemctl start httpd@first
systemctl start httpd@second
