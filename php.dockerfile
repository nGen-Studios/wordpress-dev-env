FROM php:8.2-fpm-alpine

# Setup GD extension
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql && apk add --no-cache \
	freetype \
	libjpeg-turbo \
	libpng \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	&& docker-php-ext-configure gd \
	--with-freetype=/usr/include/ \
	--with-jpeg=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-enable gd \
	&& apk del --no-cache \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	&& rm -rf /tmp/*