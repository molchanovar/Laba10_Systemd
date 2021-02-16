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
 
