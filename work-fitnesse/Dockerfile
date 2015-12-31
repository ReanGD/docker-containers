FROM debian:jessie

MAINTAINER ReanGD

ENV DEBIAN_FRONTEND noninteractive

ADD * /home/
ADD https://github.com/twbs/bootstrap/releases/download/v3.3.6/bootstrap-3.3.6-dist.zip /home/bootstrap.zip
ADD https://github.com/jquery/jquery/archive/2.1.4.zip /home/jquery.zip

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen && \
    chmod +x /home/run.sh && \
    \
    apt-get update && \
    apt-get install -y --no-install-recommends locales supervisor git && \
    apt-get install -y --no-install-recommends python3-pip python3-psycopg2 python3-lxml && \
    apt-get install -y --no-install-recommends python3-django python3-django-celery && \
    apt-get install -y --no-install-recommends python3-pkg-resources python3-six python3-requests && \
    apt-get install -y --no-install-recommends uwsgi-core uwsgi-plugin-python3 python3-uwsgidecorators && \
    apt-get install -y --no-install-recommends libssl-dev nginx && \
    apt-get install -y --no-install-recommends unzip vim && \
    \
    mkdir -p /www/app /www/static/jquery /www/static/bootstrap /www/static/django_ajax /www/static/highcharts && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/sites-enabled/default && \
    \
    pip3 install -r /home/requirements.txt && \
    \
    cp /usr/local/lib/python3.4/dist-packages/django_ajax/static/django_ajax/js/*.min.* /www/static/django_ajax && \
    \
    unzip /home/bootstrap.zip -d /home/bootstrap && \
    cp -r /home/bootstrap/bootstrap-3.3.6-dist/* /www/static/bootstrap/ && \
    rm /home/bootstrap.zip && \
    rm -rf /home/bootstrap && \
    \
    unzip /home/jquery.zip  -d /home/jquery && \
    cp /home/jquery/jquery-2.1.4/dist/*.min.* /www/static/jquery/ && \
    rm /home/jquery.zip && \
    rm -rf /home/jquery && \
    \
    git clone --branch v4.0.0 https://github.com/highslide-software/highcharts.com.git /www/static/highcharts && \
    cd /www/static/highcharts && \
    rm -rf samples tools utils test studies .git bower.json build.md build.properties build.xml changelog.htm invalidations.txt readme.md ant && \
    \
    apt-get --purge remove --auto-remove -y python3-pip unzip && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/* && \
    rm -rf /var/lib/dpkg/* && \
    rm -rf /var/lib/cache/* && \
    rm -rf /var/lib/log/* && \
    rm -rf /usr/share/i18n/ && \
    rm -rf /usr/share/doc/ && \
    rm -rf /usr/share/locale/ && \
    rm -rf /usr/share/man/ && \
    rm -rf /usr/sbin/locale-gen && \
    rm -rf /usr/sbin/update-locale && \
    rm -rf /usr/sbin/validlocale

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU.UTF-8

EXPOSE 80/tcp

VOLUME ["/www/tmp", "/www/app"]

CMD /home/run.sh
