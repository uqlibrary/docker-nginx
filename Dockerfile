FROM uqlibrary/docker-base:1

RUN \
  yum install -y nginx && \
  yum clean all

COPY etc/nginx.conf /etc/nginx/nginx.conf
COPY etc/h5bp /etc/nginx/h5bp

EXPOSE 80

ENTRYPOINT ["/usr/sbin/nginx"]
