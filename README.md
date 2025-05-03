<!-- Banner -->
<h1 align="center">
  🚀 Inception
</h1>

<p align="center">
  <i>Mini-infrastructure Dockerisée : WordPress, MariaDB, NGINX & TLS</i>
</p>

---

## 🎓 Introduction

Ce projet a pour but d'approfondir vos connaissances sur Docker et la virtualisation de services web. Vous allez mettre en place une mini-infrastructure composée de plusieurs conteneurs Docker, chacun dédié à un service spécifique, le tout orchestré via Docker Compose.

## 📚 Objectifs pédagogiques
- Comprendre et manipuler Docker, Docker Compose, les Dockerfiles et les réseaux Docker
- Appliquer les bonnes pratiques de sécurité (TLS, variables d'environnement, secrets, etc.)
- Automatiser le déploiement d'une stack web complète (WordPress, MariaDB, NGINX)

## ⚠️ Contraintes et bonnes pratiques
- **Chaque service dans son propre conteneur** (NGINX, WordPress+PHP-FPM, MariaDB)
- **Images construites à partir de l'avant-dernière version stable d'Alpine ou Debian**
- **Un Dockerfile par service, écrit à la main**
- **Pas d'images toutes faites (sauf Alpine/Debian)**
- **Pas de hacky patchs** (`tail -f`, `sleep infinity`, etc. interdits)
- **Utilisation obligatoire de variables d'environnement et de secrets**
- **Pas de mot de passe en clair dans les Dockerfiles**
- **Volumes pour la base de données et les fichiers WordPress**
- **Nom de domaine personnalisé** (`login.42.fr`)
- **NGINX unique point d'entrée (port 443, TLSv1.2/1.3)**
- **Redémarrage automatique des conteneurs en cas de crash**

## 🗂️ Structure du projet

```
Inception/
├── srcs/
│   ├── docker-compose.yml
│   ├── requirements/
│   │   ├── mariadb/
│   │   │   ├── Dockerfile
│   │   │   └── ...
│   │   ├── nginx/
│   │   │   ├── Dockerfile
│   │   │   └── ...
│   │   └── wordpress/
│   │       ├── Dockerfile
│   │       └── ...
│   └── ...
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
├── .env
├── Makefile
└── README.md
```

## 🖼️ Architecture

> ![Schéma d'architecture](./assets/architecture.png)
>
> _Placez ici le schéma fourni ou votre propre schéma dans le dossier `assets`._

- **DB** : Volume pour la base de données MariaDB
- **WordPress** : Volume pour les fichiers du site
- **NGINX** : Reverse proxy, point d'entrée unique (443)
- **Réseau Docker** : Communication interne entre les conteneurs

## 🔑 Gestion des variables d'environnement & secrets
- Toutes les variables sensibles (mots de passe, clés, etc.) doivent être stockées dans des fichiers ignorés par git (`.env`, `secrets/`)
- Exemple de `.env` :
  ```env
  DOMAIN_NAME=login.42.fr
  MYSQL_USER=xxxxxxx
  MYSQL_PASSWORD=xxxxxxx
  ...
  ```
- Utilisez Docker secrets pour les informations confidentielles

## 🛠️ Installation

1. Clonez le repository :
```bash
git clone https://github.com/votre-username/Inception.git
cd Inception
```
2. Placez vos fichiers secrets et variables d'environnement dans les dossiers appropriés
3. Lancez l'infrastructure :
```bash
make
```

## 🎯 Commandes disponibles
- `make` : Construit et démarre tous les conteneurs
- `make re` : Reconstruit et redémarre les conteneurs
- `make clean` : Arrête et supprime tous les conteneurs et volumes

## 🔧 Technologies utilisées

<p align="center">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"/>
  <img src="https://img.shields.io/badge/Docker_Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker Compose"/>
  <img src="https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white" alt="WordPress"/>
  <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white" alt="MariaDB"/>
  <img src="https://img.shields.io/badge/NGINX-009639?style=for-the-badge&logo=nginx&logoColor=white" alt="NGINX"/>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux"/>
  <img src="https://img.shields.io/badge/Make-000000?style=for-the-badge&logo=cmake&logoColor=white" alt="Make"/>
</p>

## 📝 Auteur

- **Votre Nom** - [Votre GitHub](https://github.com/votre-username)

## 📄 Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

