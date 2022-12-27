FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    wget curl
RUN curl ip.sb
EXPOSE 80 443 22
