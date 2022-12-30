FROM python:3.8-slim
WORKDIR /usr/src/app
RUN apt-get update && apt install nginx -y
RUN nginx
EXPOSE 443 80
