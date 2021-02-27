# Laba10_Systemd

Задачи: 
1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig);
2. Из репозитория epel установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi);
3. Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами;

Процесс развертывания автоматизирован с иcпользованием Vagrant shell provisioner.
 
 
 ### Results 
 #### Task 1:
 ```
 [root@systemd-lab conf]# systemctl status watchlog.timer
 watchlog.timer - Run watchlog script every 30 second
     Loaded: loaded (/etc/systemd/system/watchlog.timer; enabled; vendor preset: disabled)
    Active: active (waiting) since Fri 2021-02-26 11:10:13 UTC; 1s ago 

Feb 26 11:10:13 systemd-lab systemd[1]: Started Run watchlog script every 30 second. 
 ```
 
 #### Task 2:
```
[root@systemd-lab conf]# systemctl status spawn-fcgi
spawn-fcgi.service - Spawn-fcgi startup service
  Loaded: loaded (/etc/systemd/system/spawn-fcgi.service; disabled; vendor preset: disabled)
  Active: active (running) since Thu 2021-02-25 22:19:27 UTC; 12h ago
Main PID: 21313 (php-cgi
   CGroup: /system.slice/spawn-fcgi.service
   ├─21314 /usr/bin/php-cgi
   ├─21315 /usr/bin/php-cgi
Feb 25 22:19:27 systemd-lab systemd[1]: Started Spawn-fcgi startup service by Otus.
```


 #### Task 3: 
Несколько инстансов для Apache Server (порты 80 и 8080)
```
ss -tulpn 

Netid  State      Recv-Q Send-Q                                      Local Address:Port                                                     Peer Address:Port
tcp    LISTEN     0      128                                                  [::]:8080                                                             [::]:*                   users:(("httpd",pid=28630,fd=4),("httpd",pid=28629,fd=4),("httpd",pid=28628,fd=4),("httpd",pid=28627,fd=4),("httpd",pid=28626,fd=4),("httpd",pid=28625,fd=4))              
tcp    LISTEN     0      128                                                  [::]:80                                                               [::]:*                   users:(("httpd",pid=28577,fd=4),("httpd",pid=28576,fd=4),("httpd",pid=28575,fd=4),("httpd",pid=28574,fd=4),("httpd",pid=28573,fd=4),("httpd",pid=28572,fd=4))              
```


