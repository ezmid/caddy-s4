# The missing version contraint creeps me out
FROM abiosoft/caddy:php-no-stats

# We adding make, bash and missing PHP7 extensions for a running S4 installation
RUN apk --no-cache --update upgrade && \
	apk add \
	make \
	bash \
	php7-simplexml

COPY ./docker /

WORKDIR /app
RUN composer install

