FROM debian:stretch

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

ADD * /home/

RUN apt-get update && \
    apt-get install -y --no-install-recommends git openssh-server openjdk-7-jdk && \
    apt-get install -y --no-install-recommends python3-pip pylint3 pyflakes3 python3-pep8 python3-flake8 && \
    \
    mkdir -p /jenkins/ && \
    chmod 777 /jenkins/ && \
    mkdir /var/run/sshd/ && \
    \
    useradd jenkins && echo "jenkins:jenkins" | chpasswd && \
    sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config && \
    /home/clean.sh

EXPOSE 22

VOLUME ["/jenkins"]

CMD ["/usr/sbin/sshd", "-D"]
