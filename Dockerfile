FROM debian:buster

RUN	apt-get update -y && apt-get upgrade -y &&\
	apt-get install nginx -y && apt-get install systemd -y &&\
	apt-get install sysvinit-utils -y && apt-get install openssl -y &&\
	apt-get install wget -y &&\
	apt-get install dialog apt-utils -y &&\
	apt-get install php-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cli php-cgi -y &&\
	apt-get install default-mysql-server -y

COPY	srcs/nginx/create_cer.sh /tmp
COPY	srcs/nginx/self-signed.conf /etc/nginx/snippets
COPY	srcs/nginx/default /etc/nginx/sites-available
COPY	srcs/start_services.sh /tmp

COPY	srcs/install.sh /tmp
COPY	srcs/config.inc.php /tmp
COPY	srcs/wp-config.php /tmp
COPY 	srcs/mysql/create_databases.sh /tmp
RUN		sh /tmp/install.sh

ENTRYPOINT ["sh", "tmp/start_services.sh"]
