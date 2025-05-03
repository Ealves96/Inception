# Utiliser Debian Bullseye comme base
FROM debian:bullseye

# Mettre à jour les paquets et installer wget, PHP, et les dépendances WordPress
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget curl mariadb-client php7.4-fpm php7.4-mysql \
    php7.4-gd php7.4-mbstring php7.4-zip php7.4-intl php7.4-curl php7.4-xml \
    php-imagick

# Télécharger et installer WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress

# Installer WP-CLI pour la configuration automatique de WordPress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/

# Copier le script de configuration automatique dans le conteneur
COPY ./tools/auto-config.sh .

# Assurer les permissions d'exécution
RUN chmod +x ./auto-config.sh

# Assurer la création du dossier /run/php si nécessaire
RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Lancer le script auto-config.sh
ENTRYPOINT ["./auto-config.sh"]

# Lancer PHP-FPM en avant-plan
CMD ["/usr/sbin/php-fpm7.4", "-F"]
