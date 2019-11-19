FROM debian:stretch

RUN apt-get update && apt-get -y install gnupg2 apt-transport-https \
	&& apt-key adv --fetch-keys http://bacula.org/downloads/baculum/baculum.pub

COPY baculum.list /etc/apt/sources.list.d/baculum.list

RUN apt-get update \
	&& apt-get -y install wget dnsutils net-tools curl netcat baculum-common \
		baculum-api baculum-api-apache2 baculum-web baculum-web-apache2 \
	&& a2enmod rewrite \
	&& a2ensite baculum-api \
	&& a2ensite baculum-web

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq bacula-server bacula-client vim 

COPY bashrc /root/.bashrc

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]