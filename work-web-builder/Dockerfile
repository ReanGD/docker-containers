FROM debian:jessie

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

ADD * /home/

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    \
    apt-get update && \
    apt-get install -y --no-install-recommends locales git openssh-server openjdk-7-jdk && \
    apt-get install -y --no-install-recommends python3-pip pylint3 && \
    \
    mkdir -p /jenkins/ && \
    chmod 777 /jenkins/ && \
    mkdir /var/run/sshd/ && \
    \
    adduser --quiet jenkins && echo "jenkins:jenkins" | chpasswd && \
    sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config && \
    /home/clean.sh

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

EXPOSE 22

VOLUME ["/jenkins"]

CMD ["/usr/sbin/sshd", "-D"]
