FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt -y install novnc python3-websockify python3-numpy expect
RUN apt -y install tigervnc-standalone-server xfce4 dbus-x11 xterm
RUN apt -y install keepass2
RUN apt -y install openssh-server sudo vim ftp curl
RUN apt -y install snmp snmpd snmp-mibs-downloader

COPY snmpd.conf /etc/snmp/snmpd.conf

RUN chmod +s /usr/bin/python3

RUN apt clean

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
COPY check_connection.sh .
RUN chmod +x check_connection.sh


RUN useradd john -s /bin/bash -b /home -p $(perl -e "print crypt('2uMxwwLyqoZzPl0PC5kSOEB7KAMDpw2S','sa');")
RUN mkdir /home/john/
RUN chown -R john:john /home/john

COPY Desktop /root/Desktop
COPY coredump /var/lib/systemd/coredump

RUN gzip -d /var/lib/systemd/coredump/*
RUN chmod o-r /var/lib/systemd/coredump/*

ENTRYPOINT ["./entrypoint.sh"]
