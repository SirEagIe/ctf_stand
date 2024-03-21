#!/bin/bash

service nginx start
sed -i "s\UI.initSetting('path', 'websockify');\UI.initSetting('path', window.location.pathname.replace(/[^/]*$/, '').substring(1) + 'websockify');\g" /usr/share/novnc/app/ui.js

i=0
while read creds; do
    user=$(echo $creds | awk -F ":" '{print $1}')
    pass=$(echo $creds | awk -F ":" '{print $2}')
    useradd $user -s /bin/bash -b /home -p $(perl -e "print crypt('$pass','sa');") -G basic_sudo
    mkdir /home/$user
    cp ./vncpasswd.sh /home/"$user"
    chown -R $user:$user /home/"$user"
    chmod o-rwx /home/"$user"
    su $user -c "~/vncpasswd.sh $pass"
    su $user -c "chmod 600 ~/.vnc/passwd"
    su $user -c "tigervncserver -xstartup /usr/bin/startxfce4 -geometry 1600x900 -localhost no :$i"
    su $user -c "websockify -D --web=/usr/share/novnc/ --cert=/home/ubuntu/novnc.pem $[8080+$i] localhost:$[5900+$i]"
    su $user -c "cd ~"
    i=$[$i+1]
done < creds.txt

./vncpasswd.sh qweqwe123
tigervncserver -xstartup /usr/bin/startxfce4 -geometry 1600x900 -localhost no :20
websockify -D --web=/usr/share/novnc/ --cert=/home/ubuntu/novnc.pem 8100 localhost:5920

tail -f /dev/null
