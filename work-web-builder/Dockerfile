FROM debian:jessie

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

ADD * /home/

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    \
    apt-get update && \
    apt-get install -y --no-install-recommends locales git openssh-server openjdk-7-jdk && \
    apt-get install -y --no-install-recommends python3-pip && \
    \
    mkdir -p /jenkins/ && \
    chmod 777 /jenkins/ && \
    \
    adduser --no-create-home --quiet jenkins && echo "jenkins:jenkins" | chpasswd && \
    mkdir /var/run/sshd && \
#    /home/clean.sh && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

EXPOSE 22

VOLUME ["/jenkins"]

CMD ["/usr/sbin/sshd", "-D"]
