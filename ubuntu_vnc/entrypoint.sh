#!/bin/bash

service snmpd restart
tigervncserver -xstartup /usr/bin/startxfce4 -geometry 1600x900 -localhost no :1
websockify --web=/usr/share/novnc/ --cert=/home/ubuntu/novnc.pem 8080 localhost:5901
