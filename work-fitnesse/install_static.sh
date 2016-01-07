mkdir -p /www/app /www/static/jquery /www/static/bootstrap /www/static/highcharts

ln -s /usr/local/lib/python3.4/dist-packages/django_ajax/static/django_ajax/js /www/static/django_ajax
ln -s /usr/lib/python3/dist-packages/django/contrib/admin/static/admin /www/static/admin
ln -s /usr/lib/python3/dist-packages/djcelery/static/djcelery /www/static/djcelery

unzip /home/bootstrap.zip -d /home/bootstrap
cp -r /home/bootstrap/bootstrap-3.3.6-dist/* /www/static/bootstrap/
rm -rf /home/bootstrap

unzip /home/jquery.zip  -d /home/jquery
cp /home/jquery/jquery-2.1.4/dist/*.min.* /www/static/jquery/
rm -rf /home/jquery

git clone --branch v4.0.0 https://github.com/highslide-software/highcharts.com.git /www/static/highcharts
cd /www/static/highcharts
rm -rf samples tools utils test studies .git bower.json build.md build.properties build.xml changelog.htm invalidations.txt readme.md ant
