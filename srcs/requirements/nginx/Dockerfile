# Utiliser Debian Bullseye comme base
FROM debian:bullseye

# Installer NGINX et OpenSSL, créer le dossier SSL, générer un certificat auto-signé, configurer le répertoire web
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt \
    -subj "/CN=localhost" && \
    mkdir -p /var/www && \
    echo "<html><body><h1>NGINX works on Bullseye!</h1></body></html>" > /var/www/index.html && \
    chmod 755 /var/www && \
    chown -R www-data:www-data /var/www && \
    rm -rf /var/lib/apt/lists/*

# Copier les fichiers de configuration personnalisés pour NGINX
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Exposer le port 443 pour HTTPS
EXPOSE 443

# Lancer NGINX en mode non-démonisé
CMD ["nginx", "-g", "daemon off;"]
