FROM kalilinux/kali-rolling

RUN apt -y update
RUN apt -y install novnc python3-websockify python3-numpy expect
RUN apt -y install tigervnc-standalone-server dbus-x11 xterm
RUN apt -y install kali-desktop-xfce
RUN apt -y install openssh-server
# git vim nmap

RUN apt -y install nginx
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

WORKDIR /root

COPY vncpasswd.sh .
COPY creds.txt .
COPY sudoers /etc/sudoers

RUN addgroup basic_sudo
RUN chmod u+x vncpasswd.sh
RUN mv /usr/share/novnc/vnc.html /usr/share/novnc/index.html

RUN apt clean

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
# V3rY_Str0NG_P4$$w0rD
