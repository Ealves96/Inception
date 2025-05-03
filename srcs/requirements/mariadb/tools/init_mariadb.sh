#!/bin/bash

#permissions config.json si necessaire
if [ -f "/home/ealves/.docker/config.json" ]; then
    sudo chown ealves:ealves /home/ealves/.docker/config.json
    sudo chmod 600 /home/ealves/.docker/config.json
fi

# Démarrer MariaDB en arrière-plan
echo "Lancement de MariaDB..."
/usr/bin/mysqld_safe --user=mysql &

# Boucle pour vérifier que MariaDB est bien démarré
timeout=60
elapsed=0
while ! mysqladmin ping -u root -p"${MYSQL_ROOT_PASSWORD}" --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
    elapsed=$((elapsed + 2))
    if [ $elapsed -ge $timeout ]; then
        echo "Timeout reached: MariaDB n'est pas prêt après $timeout secondes."
        exit 1
    fi
done

# Exécuter les commandes SQL avec le mot de passe root pour initialiser la base de données
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOSQL

# Arrêter proprement MariaDB temporaire
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Lancer MariaDB en mode sécurisé au premier plan
exec /usr/bin/mysqld_safe --user=mysql --console
