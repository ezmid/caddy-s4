# The missing version contraint creeps me out
FROM abiosoft/caddy:0.11.2-php-no-stats

LABEL maintainer="Filip Cieker <filip.cieker@ezmid.com>, Filip Cieker <filip.cieker@gmail.com>"

# We adding make, bash and missing PHP7 extensions for a running S4 installation
RUN apk --no-cache --update upgrade && \
	apk add \
	make \
	bash \
    php7-opcache \
	php7-simplexml

# 1:1 Copy
COPY ./docker /

# Switch workspace context and install Composer deps
WORKDIR /app
RUN composer install --optimize-autoloader --prefer-dist

# Clean up
RUN mkdir -p /var/log/php7 && \
    touch /var/log/php7/error.log && \
    chown -R nobody:nobody /var/log/php7 && \
    chmod 0777 -R /var/log/php7
