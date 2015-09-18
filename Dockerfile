FROM uqlibrary/docker-base:3

RUN \
  yum install -y nginx && \
  yum clean all

COPY etc/nginx.conf /etc/nginx/nginx.conf
COPY etc/h5bp /etc/nginx/h5bp

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
