FROM extremeshok/baseimage-ubuntu AS BUILD
LABEL mantainer="Adrian Kriel <admin@extremeshok.com>" vendor="eXtremeSHOK.com"

RUN echo "**** Install packages ****" \
  && apt-install bash ca-certificates libpcre++ libfcgi-bin supervisor curl unzip imagemagick jpegoptim pngquant optipng gifsicle sqlite less mariadb-client openssl netcat

# notice the  is required to avoid getting default php packages from alpine instead.
RUN echo  "**** Install php and some extensions ****" \
  && apt-install php7.2 php7.2-fpm php7.2-common\
  php-imagick \
  #php-libsodium \
  php-pear \
  php-redis \
  php7.2-bcmath \
  php7.2-curl \
  php7.2-gd \
  php7.2-imap \
  php7.2-intl \
  php7.2-json \
  php7.2-mbstring \
  php7.2-mysql \
  php7.2-opcache \
  php7.2-sqlite3 \
  php7.2-xml \
  php7.2-zip

RUN echo "**** Install IONCUBE ****" \
  && mkdir -p /tmp/ioncube \
  && cd /tmp/ioncube \
  && wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip -O /tmp/ioncube/ioncube.zip \
  && unzip -oq ioncube.zip \
  && mkdir -p /usr/lib/php7.2/modules/ \
  && cp -rf /tmp/ioncube/ioncube/ioncube_loader_lin_7.2.so /usr/lib/php7.2/modules/ \
  && chmod +x /usr/lib/php7.2/modules/ioncube_* \
  && rm -rf /tmp/ioncube

RUN echo "**** Install composer ****" \
  && mkdir -p /tmp/composer \
  && cd /tmp/composer \
  && wget https://getcomposer.org/installer -O /tmp/composer/installer.php \
  && php installer.php --install-dir=/usr/local/bin --filename=installer.php \
  && rm -rf /tmp/composer

RUN echo "**** install msmtp ****" \
  && apt-install msmtp

RUN echo "**** configure ****"
COPY rootfs/ /

# Update ca-certificates
RUN echo "**** Update ca-certificates ****" \
  && update-ca-certificates

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN echo "**** Fix permissions ****" \
  && mkdir -p /var/www/html \
  && mkdir -p /run/php \
  && chown -R nobody:nogroup /var/www/html \
  && chown -R nobody:nogroup /run/php

RUN echo "**** Link php cli to fpm config ****" \
  && rm -rf /etc/php/7.2/cli \
  &&  ln -s /etc/php/7.2/fpm /etc/php/7.2/cli

WORKDIR /var/www/html

EXPOSE 9000

# "when the SIGTERM signal is sent to the php-fpm process, it immediately quits and all established connections are closed"
# "graceful stop is triggered when the SIGUSR1 signal is sent to the php-fpm process"
STOPSIGNAL SIGUSR1

# requires the fcgi package
HEALTHCHECK --interval=5s --timeout=5s CMD REDIRECT_STATUS=true SCRIPT_NAME=/fpm-ping SCRIPT_FILENAME=/fpm-ping REQUEST_METHOD=GET cgi-fcgi -bind -connect 127.0.0.1:9000

ENTRYPOINT ["/init"]
