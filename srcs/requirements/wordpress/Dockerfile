FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm mariadb-client wget

COPY ./www.conf /etc/php/7.3/fpm/pool.d
ADD https://ru.wordpress.org/wordpress-5.9.3-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.9.3-ru_RU.tar.gz
RUN rm -f /var/www/wordpress-5.9.3-ru_RU.tar.gz /var/www/wordpress/wp-config-sample.php

COPY ./wp-config.php /var/www/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar &&  mv wp-cli.phar /usr/local/bin/wp-cli

COPY ./config.sh /var/www/
RUN chmod +x /var/www/config.sh
RUN mkdir ./run/php/

ENTRYPOINT [ "/var/www/config.sh" ]