FROM kalilinux/kali-rolling

RUN apt -y update
RUN apt -y install novnc python3-websockify python3-numpy expect
RUN apt -y install tigervnc-standalone-server dbus-x11 xterm
RUN apt -y install kali-desktop-xfce
RUN apt -y install openssh-server

COPY vncpasswd.sh .

RUN chmod +x vncpasswd.sh
RUN ./vncpasswd.sh
RUN rm vncpasswd.sh

RUN apt clean

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
# V3rY_Str0NG_P4$$w0rD