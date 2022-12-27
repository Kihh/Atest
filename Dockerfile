FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget curl unzip ssh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config
RUN echo root:123123|chpasswd
RUN service sshd restart
RUN wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN chmod +x ngrok
RUN ./ngrok tcp --authtoken 28ZXAvx0WT1VJq7uxWzTQfdkl63_3jnq34CkMiMtECTipvBsZ --region jp 22 &
RUN curl ip.sb
EXPOSE 80 443 22
