FROM ubuntu
RUN apt update && apt install -y \
    ssh wget curl
RUN wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O /ngrok-stable-linux-amd64.zip\
    && cd / && unzip ngrok-stable-linux-amd64.zip \
    && chmod +x ngrok
RUN mkdir /run/sshd && /ngrok tcp --authtoken 28ZXAvx0WT1VJq7uxWzTQfdkl63_3jnq34CkMiMtECTipvBsZ --region jp 22 && sleep 5 && curl http://localhost:4040/api/tunnels && /usr/sbin/sshd -D && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config && echo root:123123|chpasswd
