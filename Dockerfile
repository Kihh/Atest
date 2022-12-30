FROM ubuntu
RUN apt update && apt install -y wget curl
EXPOSE 80 443 22
