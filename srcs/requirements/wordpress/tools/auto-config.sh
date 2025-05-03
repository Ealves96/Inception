#!/bin/bash
set -ux

# Attendre que la base de données MariaDB soit prête
# sleep 10

# Si le fichier de configuration n'existe pas, créer wp-config.php
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp-cli.phar config create --allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

# Installer WordPress si ce n'est pas déjà fait
if ! $(wp-cli.phar core is-installed --allow-root --path='/var/www/wordpress'); then
    wp-cli.phar core install --allow-root --url=$DOMAIN_NAME \
    --title=$WORDPRESS_TITLE \
    --admin_user=$WORDPRESS_ADMIN_USER \
    --admin_password=$WORDPRESS_ADMIN_PASSWORD \
    --admin_email=$WORDPRESS_ADMIN_EMAIL --path='/var/www/wordpress'
    
    # Créer un deuxième utilisateur WordPress
    wp-cli.phar user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root --path='/var/www/wordpress'
fi

# Assurer les permissions pour www-data sur le répertoire WordPress
chown -R www-data:www-data /var/www/wordpress

# Lancer PHP-FPM
/usr/sbin/php-fpm7.4 -F
