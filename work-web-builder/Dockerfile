FROM debian:jessie

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    \
    apt-get update && \
    apt-get install -y --no-install-recommends locales git openssh-server openjdk-7-jdk && \
    apt-get install -y --no-install-recommends python3-pip && \
    \
    adduser --quiet jenkins && echo "jenkins:jenkins" | chpasswd && \
    mkdir /var/run/sshd && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    \
    adduser --system --no-create-home --disabled-login --disabled-password --group web_user && \
    rm /etc/nginx/sites-enabled/default && \
    pip3 install -r /home/requirements.txt && \
    /home/install_static.sh && \
    apt-get --purge remove --auto-remove -y unzip && \
    /home/clean.sh

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
