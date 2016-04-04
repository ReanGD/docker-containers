FROM debian:stretch

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

ADD * /tmp/

RUN apt-get update && \
    apt-get install -y --no-install-recommends git openssh-server openjdk-7-jdk && \
    apt-get install -y --no-install-recommends python3-pip pylint3 pyflakes3 python3-pep8 python3-flake8 && \
    pip3 install Django===1.9.1 && \
    \
    useradd -m jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir -p /jenkins && \
    \
    chmod +x /tmp/clean.sh && \
    chmod +x /tmp/run.sh && \
    mkdir /var/run/sshd/ && \
    \
    sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config && \
    /tmp/clean.sh

EXPOSE 22

VOLUME ["/jenkins"]

CMD /tmp/run.sh
