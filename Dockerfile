FROM ubuntu
RUN apt update && apt install -y \
    ssh wget curl
RUN mkdir /run/sshd \
    && echo '/usr/sbin/sshd -D' >>/openssh.sh \
    && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config  \
    && echo root:123123|chpasswd \
    && chmod 755 /openssh.sh
EXPOSE 22
CMD /openssh.sh
