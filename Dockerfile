FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    ssh wget unzip vim curl ubuntu-destop xrdp
RUN wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O /ngrok-stable-linux-amd64.zip\
    && cd / && unzip ngrok-stable-linux-amd64.zip \
    && chmod +x ngrok
RUN mkdir /run/sshd \
    && echo "/ngrok tcp --authtoken 2JS3tDJNTdsyG2AVxaWPU69gtbz_5ycxiTdX2xrwLeGsjB5fp --region jp 22 &" >>/openssh.sh \
    && echo "sleep 5" >> /openssh.sh \
    && echo "curl http://localhost:4040/api/tunnels" >> /openssh.sh \
    && echo '/usr/sbin/sshd -D' >>/openssh.sh \
    && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config  \
    && echo root:123123|chpasswd \
    && chmod 755 /openssh.sh
EXPOSE 80 443 22
CMD /openssh.sh
