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
    apt-get install -y --no-install-recommends locales git openssh-server openjdk-7-jdk npm zip && \
    apt-get install -y --no-install-recommends python3-pip sloccount gettext && \
    \
    pip3 install -e git+git://github.com/kmmbvnr/django-jenkins.git#egg=django-jenkins && \
    pip3 install -r /home/requirements.txt && \
    \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    npm install -g jshint && \
    npm install -g csslint && \
    \
    useradd -m jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir -p /jenkins && \
    \
    mkdir /var/run/sshd/ && \
    sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config && \
    /home/clean.sh

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

EXPOSE 22

VOLUME ["/jenkins"]

CMD /home/run.sh
