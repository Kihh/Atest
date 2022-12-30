FROM ubuntu
RUN apt-get update && apt install wget
RUN mkdir test
EXPOSE 80 443 22
