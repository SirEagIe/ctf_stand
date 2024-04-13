FROM python:latest 

RUN apt -y update
RUN apt -y install ssh
RUN apt -y install sudo
RUN apt -y install vim


RUN apt clean

WORKDIR /app
COPY ./app .
COPY sudoers /etc/sudoers

RUN pip install -r requirements.txt

CMD ["python3", "-u", "run.py"]
