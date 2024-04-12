FROM ubuntu:24.04

RUN apt -y update
RUN apt -y install

RUN apt clean

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
# V3rY_Str0NG_P4$$w0rD
