FROM  dockerfile/nginx

COPY nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y supervisor && \
    apt-get autoremove -y && \
    apt-get autoclean

COPY nginx_config.sh /opt/nginx_config.sh
RUN chmod +x /opt/nginx_config.sh

COPY site.config /etc/nginx/sites-available/php
RUN ln -s /etc/nginx/sites-available/php /etc/nginx/sites-enabled/php && \
    rm -f /etc/nginx/sites-enabled/default

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
