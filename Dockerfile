FROM php:7-fpm

MAINTAINER Mateusz Koszutowski <mkoszutowski@divante.pl>

RUN apt-get update \
	&& apt-get install -y \
		libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
		libxml2-dev \
		zlib1g-dev \
		libbz2-dev \
		libicu-dev \
    && docker-php-ext-install \
		pdo_mysql \
		iconv \
		dom \
		simplexml \
		exif \
		fileinfo \
		mbstring \
		zip \
		bz2 \
		intl \
		opcache \
	&& docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd