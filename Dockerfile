FROM php:7.1.3-alpine

RUN apk update && \
    apk add --no-cache icu-libs && \
    apk add --no-cache --virtual builder icu-dev && \
    docker-php-ext-install intl pdo_mysql && \
    apk del --no-cache --purge builder

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
