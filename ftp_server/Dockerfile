FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt -y install vsftpd vim sudo

RUN apt clean

RUN useradd john -s /bin/bash -b /home -p $(perl -e "print crypt('VU5GNkumWT7SpI^!KAVZwSiiK1Dz@h!M','sa');") -G sudo
RUN mkdir -p /home/john/userfiles
RUN chown root:root /home/john

COPY ./flag.txt /home/john/userfiles/flag.txt
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
