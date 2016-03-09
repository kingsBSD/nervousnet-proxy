FROM debian:jessie

MAINTAINER Giles Richard Greenway

RUN apt-get -q -y update

RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y --fix-missing install \
    mariadb-client \
    mariadb-server-10.0 \
    openjdk-7-jre \
    supervisor

ADD proxy /proxy
RUN chmod u+x /proxy/proxy/build/*.sh 

RUN sed -i 's/\(<sqlUsername>\).*\(<\/sqlUsername>\)/\1nervous_admin\2/' /proxy/proxy/build/config.xml
RUN sed -i 's/\(<sqlPassword>\).*\(<\/sqlPassword\)/\1nervous\2/' /proxy/proxy/build/config.xml

RUN /etc/init.d/mysql start && mysql -e \
    "CREATE USER nervous_admin IDENTIFIED BY 'password'; CREATE DATABASE nervous;" 
RUN /etc/init.d/mysql start && mysql -e \
    "GRANT ALL PRIVILEGES ON nervous . * TO nervous_admin@localhost; SET PASSWORD FOR nervous_admin@localhost = PASSWORD('nervous');"

ADD supervisord /etc/supervisor/conf.d

CMD ["/usr/bin/supervisord"]
