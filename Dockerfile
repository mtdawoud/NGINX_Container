FROM nginx:1.23.3

COPY nginx.conf /etc/nginx/nginx.conf
COPY www.dawoud-website.com /etc/nginx/conf.d/www.dawoud-website.com
COPY index.html /usr/share/nginx/html/index.html

COPY webserver.crt /etc/nginx/ssl/webserver.crt
COPY webserver.key /etc/nginx/ssl/webserver.key

EXPOSE 80
EXPOSE 443
