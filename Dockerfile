FROM  uqlibrary/docker-base

RUN \
  yum install -y nginx && \
  yum clean all

COPY nginx.conf /etc/nginx/nginx.conf

COPY nginx_config.sh /opt/nginx_config.sh
RUN chmod +x /opt/nginx_config.sh

RUN rm -f /etc/nginx/conf.d/*
COPY site.conf /etc/nginx/conf.d/site.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
