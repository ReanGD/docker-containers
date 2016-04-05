FROM debian:stretch

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

ADD * /home/

RUN chmod +x /home/clean.sh && \
    chmod +x /home/run.sh && \
    \
    echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    \
    apt-get update && \
    apt-get install -y --no-install-recommends locales git openssh-server openjdk-7-jdk && \
    apt-get install -y --no-install-recommends python3-pip pylint3 pyflakes3 python3-pep8 python3-flake8 && \
    pip3 install -r /home/requirements.txt && \
    \
    useradd -m jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir -p /jenkins && \
    \
    mkdir /var/run/sshd/ && \
    sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config && \
    /home/clean.sh

EXPOSE 22

VOLUME ["/jenkins"]

CMD /home/run.sh
