<!-- Banner -->
<h1 align="center">
  🚀 Inception
</h1>

<p align="center">
  <i>Mini-infrastructure Dockerisée : WordPress, MariaDB, NGINX & TLS</i>
</p>

---

## 🎓 Introduction

Bienvenue sur mon projet Inception ! J'ai réalisé ce projet pour approfondir mes connaissances sur Docker et la virtualisation de services web. J'ai mis en place une mini-infrastructure composée de plusieurs conteneurs Docker, chacun dédié à un service spécifique, le tout orchestré via Docker Compose.

## 📚 Ce que j'ai appris et mis en place
- Manipulation avancée de Docker, Docker Compose, Dockerfiles et réseaux Docker
- Application des bonnes pratiques de sécurité (TLS, variables d'environnement, secrets, etc.)
- Automatisation du déploiement d'une stack web complète (WordPress, MariaDB, NGINX)
- Gestion des volumes pour la persistance des données
- Utilisation de Docker secrets et de fichiers .env pour la sécurité

## ⚠️ Contraintes et bonnes pratiques respectées
- Chaque service tourne dans son propre conteneur (NGINX, WordPress+PHP-FPM, MariaDB)
- Toutes les images sont construites à partir de l'avant-dernière version stable de Debian
- J'ai écrit un Dockerfile personnalisé pour chaque service
- Aucun mot de passe n'est présent en clair dans les Dockerfiles
- Les variables sensibles sont stockées dans des fichiers ignorés par git
- Les volumes sont utilisés pour la base de données et les fichiers WordPress
- Le nom de domaine personnalisé est configuré (`ealves.42.fr`)
- NGINX est le point d'entrée unique (port 443, TLSv1.2/1.3)
- Les conteneurs redémarrent automatiquement en cas de crash

## 🗂️ Structure de mon projet

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

- **DB** : Volume pour la base de données MariaDB
- **WordPress** : Volume pour les fichiers du site
- **NGINX** : Reverse proxy, point d'entrée unique (443)
- **Réseau Docker** : Communication interne entre les conteneurs

## 🛠️ Installation

1. Clonez le repository :
```bash
git clone https://github.com/mon-username/Inception.git
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
