# Laba10_Systemd


### First Try

The .service file (put to path `/etc/systemd/system/my_daemon.service`)
For starting service file without root permissions `$HOME/.config/systemd/user/my_daemon.service`
 ```
 [Unit]
Description=My Miscellaneous Service
After=network.target

[Service]
Type=simple
# Another Type: forking
User=nanodano
WorkingDirectory=/home/nanodano
ExecStart=/home/nanodano/my_daemon --option=123
Restart=on-failure
# Other restart options: always, on-abort, etc

# The install section is needed to use
# `systemctl enable` to start on boot
# For a user service that you want to enable
# and start automatically, use `default.target`
# For system level services, use `multi-user.target`
[Install]
WantedBy=multi-user.target
 ```
 
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


