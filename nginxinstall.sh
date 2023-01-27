#!/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install docker -y
sudo systemctl start docker
sudo yum install git -y
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx.service
sudo chmod 777 -R /usr/share/nginx/html/
sudo echo -e '<html>\n<html>\n\t<body>\n\t\t<h1>Hello CGI!</h1>\n\t</body>\n</html>' > /usr/share/nginx/html/index.html
sudo systemctl restart nginx.service