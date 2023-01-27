server {
        listen 80 default_server;
        listen [::]:80 default_server;
        server_name automation-challenge.cgi.com www.automation-challenge.cgi.com;
        return 301 https://$host$request_uri;
}
server {
        ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        ssl_certificate "/etc/nginx/ssl/webserver.crt";
        ssl_certificate_key "/etc/nginx/ssl/webserver.key";
        root /usr/share/nginx/html;
        index index.html index.htm index.nginx-debian.html;
        server_name automation-challenge.cgi.com www.automation-challenge.cgi.com;

        if ($host = www.automation-challenge.cgi.com) {
            return 301 https://$host$request_uri;
        }

        if ($host = automation-challenge.cgi.com) {
            return 301 https://$host$request_uri;
        }


        location / {
                try_files $uri $uri/ =404;
        }
}