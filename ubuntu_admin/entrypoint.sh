#!/bin/bash

service snmpd restart
service ssh start
#tigervncserver -xstartup /usr/bin/startxfce4 -geometry 1600x900 -localhost no :1
#websockify --web=/usr/share/novnc/ --cert=/home/ubuntu/novnc.pem 8080 localhost:5901
useradd john -s /bin/bash -b /home -p $(perl -e "print crypt('@-.+KHQSKO?T23^K%*OL?@9#GIC','sa');")
mkdir /home/john
tail -f /dev/null

