FROM athieriot/docker-klondike:2.1.1

MAINTAINER Didstopia <support@didstopia.com>

WORKDIR /

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get autoremove -y && \
	apt-get install -y \
	nginx \
	apache2-utils \
	&& rm -rf /var/cache/apt/*

# Remove default nginx stuff
RUN rm -fr /usr/share/nginx/html/* && \
	rm -fr /etc/nginx/sites-available/* && \
	rm -fr /etc/nginx/sites-enabled/*

# Use a custom nginx configuration
COPY nginx_klondike.conf /etc/nginx/nginx.conf

VOLUME /data

COPY Settings.config /app/Settings.config

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80

ENTRYPOINT ["./run.sh"]
