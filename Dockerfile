# =============================================================================
# Base CLI Container
# =============================================================================
FROM php:7.2-cli as base_cli

FROM base_cli as dev_cli
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "memory_limit = -1" >> /usr/local/etc/php/conf.d/memory.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/datetime.ini

