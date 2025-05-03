# Utiliser Debian Bullseye comme image de base
FROM debian:bullseye

# Mise à jour des paquets et installation de MariaDB
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install mariadb-server -y

# Créer les répertoires nécessaires et définir les permissions
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    # chmod -R 750 /var/lib/mysql /var/run/mysqld
    mkdir -p /var/log/mysql
    
# Copier la configuration MariaDB
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copier le script d'initialisation
COPY ./tools/init_mariadb.sh /var/init_mariadb.sh


# Rendre le script d'initialisation exécutable
RUN chmod +x /var/init_mariadb.sh

# Exposer le port MariaDB
EXPOSE 3306

# Définir le script d'initialisation comme commande de démarrage
CMD ["/var/init_mariadb.sh"]