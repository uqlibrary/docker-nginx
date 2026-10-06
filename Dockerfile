FROM nginx:stable-alpine3.24

RUN \
    # Upgrade
    apk upgrade --update --no-cache && \
    # Use Edge for important CVE updates
    apk add --upgrade --no-cache -X https://dl-cdn.alpinelinux.org/alpine/edge/main busybox busybox-binsh ssl_client

RUN \
  echo 'fastcgi_param HTTP_PROXY "";' >> /etc/nginx/fastcgi.conf && \
  echo 'fastcgi_buffers 8 16k;' >> /etc/nginx/fastcgi.conf && \
  echo 'fastcgi_buffer_size 16k;' >> /etc/nginx/fastcgi.conf && \
  echo 'fastcgi_busy_buffers_size 32k;' >> /etc/nginx/fastcgi.conf

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
