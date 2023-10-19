FROM php:8.0-apache

# Install CURL and MySQL extensions
RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev libpq-dev git && \
    docker-php-ext-install

WORKDIR /var/www/html

# Clone the repository
RUN rm -rf /var/www/html/* && \
    git clone https://github.com/cooliceycold/randompicapiphp.git /tmp/randompicapiphp && \
    cp -r /tmp/randompicapiphp/* /var/www/html/ && \
    rm -rf /tmp/randompicapiphp 
RUN chmod 777 /var/www -R

# 配置 Apache 服务器
RUN a2enmod rewrite

# 将容器的80端口暴露出来
EXPOSE 80
