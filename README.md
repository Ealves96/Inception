<!-- Banner -->
<h1 align="center">
  🚀 Inception
</h1>

Ce projet est une infrastructure Docker qui met en place un environnement de développement web complet avec WordPress et MariaDB.

## 📋 Description

Inception est un projet qui démontre la mise en place d'une infrastructure Docker complète pour héberger un site WordPress avec une base de données MariaDB. Le projet utilise Docker Compose pour orchestrer les différents services et conteneurs.

## 🛠️ Installation

1. Clonez le repository :
```bash
git clone https://github.com/votre-username/Inception.git
cd Inception
```

2. Lancez l'infrastructure :
```bash
make
```

## 🎯 Commandes disponibles

- `make` : Construit et démarre tous les conteneurs
- `make re` : Reconstruit et redémarre les conteneurs
- `make clean` : Arrête et supprime tous les conteneurs et volumes

## 📁 Structure du projet

```
Inception/
├── srcs/
│   └── docker-compose.yml
├── Makefile
└── README.md
```

## 🔧 Technologies utilisées

<p align="center">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"/>
  <img src="https://img.shields.io/badge/Docker_Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker Compose"/>
  <img src="https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white" alt="WordPress"/>
  <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white" alt="MariaDB"/>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux"/>
  <img src="https://img.shields.io/badge/Make-000000?style=for-the-badge&logo=cmake&logoColor=white" alt="Make"/>
</p>

## 📝 Auteur

- **Votre Nom** - [Votre GitHub](https://github.com/votre-username)

## 📄 Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.
