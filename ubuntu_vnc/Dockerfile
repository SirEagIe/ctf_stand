FROM ubuntu:24.04

RUN apt -y update
RUN apt -y install novnc python3-websockify python3-numpy expect
RUN apt -y install tigervnc-standalone-server xfce4 dbus-x11 xterm
RUN apt -y install keepass2
RUN apt -y install openssh-server
RUN apt -y install snmp snmpd snmp-mibs-downloader
RUN apt -y install sudo
RUN apt -y install vim

COPY vncpasswd.sh .
COPY snmpd.conf /etc/snmp/snmpd.conf
COPY sudoers /etc/sudoers

RUN chmod +s /usr/bin/python3

RUN chmod +x vncpasswd.sh
RUN ./vncpasswd.sh
RUN rm vncpasswd.sh

RUN apt clean

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
# V3rY_Str0NG_P4$$w0rD
