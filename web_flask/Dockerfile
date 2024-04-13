FROM python:latest 

RUN apt -y update
RUN apt -y install ssh sudo vim iproute2

RUN apt clean

WORKDIR /app
COPY ./app .
COPY sudoers /etc/sudoers

RUN pip install -r requirements.txt

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN useradd john -s /bin/bash -b /home -p $(perl -e "print crypt('vYy@aEqBhFdTZ728z15NcyyeB^Cn6%%I','sa');")
RUN mkdir -p /home/john/.ssh
COPY ./id_rsa.pub /home/john/.ssh/authorized_keys
RUN chown -R john:john /home/john
RUN chmod 700 /home/john/.ssh
RUN chmod 600 /home/john/.ssh/authorized_keys

ENTRYPOINT ["./entrypoint.sh"]
