FROM php:7.4.1-cli

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --quiet \
    build-essential \
    libmagickwand-dev \
 && apt-get clean all

RUN pecl install imagick \
 && docker-php-ext-enable imagick

RUN apt-get install php-zip
RUN apt-get install php7.4-xml
RUN apt-get install php7.4-common
RUN apt-get install php7.4-gd
RUN apt-get install php7.4-mbstring
RUN apt-get install php7.4-curl
RUN apt-get install php7.4-cli

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php composer-setup.php \
	&& php -r "unlink('composer-setup.php');" \
	&& mv composer.phar /usr/bin/composer