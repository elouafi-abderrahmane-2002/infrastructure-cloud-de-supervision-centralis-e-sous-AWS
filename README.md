# Infrastructure Cloud de Supervision Centralisée avec Zabbix sur AWS


## 📝 Description
Ce projet porte sur la conception et le déploiement d'une solution de supervision centralisée dans un environnement Cloud. L'objectif est de monitorer un parc informatique hybride (Linux & Windows) en utilisant une architecture conteneurisée . La stack serveur (Zabbix Server, Interface Web, Base de données) est déployée via **Docker-Compose** sur AWS EC2, tandis que les métriques sont collectées par des **Agents Zabbix 2** modernes.


## 🏗️ Architecture
L'infrastructure repose sur un réseau segmenté et sécurisé au sein d'AWS :
* **Réseau** : 1 VPC (`10.0.0.0/16`), 1 Subnet Public, 1 Internet Gateway .
* **Serveur de Supervision** : Instance EC2 `t3.large` (Ubuntu 24.04) hébergeant la stack Docker.
* **Clients Monitorés** :
* 🐧 1 Instance Ubuntu Server (`t3.medium`).
* 🪟 1 Instance Windows Server 2022 (`t3.large`).
* **Flux** : Communication via les ports `10050` (Agent) et `10051` (Trapper).



## 🛠️ Prérequis
* Compte **AWS Academy Learner Lab**.
* Paire de clés SSH (`.pem`) pour l'accès aux instances.
* Client SSH (Terminal ou PuTTY) et Client RDP (pour Windows).

## 🚀 Guide d'installation pas à pas

### 1. Configuration Réseau (AWS Console)
1. Créer le VPC `VPC-Zabbix-BOULAALAM` et attacher l'IGW .
2. Configurer la table de routage avec une route par défaut `0.0.0.0/0` vers l'IGW.
3. Configurer les **Security Groups** pour autoriser les ports 80, 22, 3389, 10050 et 10051

### 2. Déploiement du Serveur Zabbix (Docker)
Connectez-vous à l'instance serveur et exécutez :
```bash
# Installation de Docker
sudo apt update && sudo apt install -y docker.io docker-compose
# Lancement de la stack
cd ~/zabbix-stack
sudo docker-compose up -d
```

### 3. Installation des Agents
*  **Sur Linux** : Installer le paquet `zabbix-agent2` et configurer le serveur pointant vers l'IP privée du serveur.
*  **Sur Windows** : Installer via le MSI et autoriser le port 10050 dans le pare-feu PowerShell.


## ⚙️ Configuration
Le fichier `docker-compose.yml` utilise les images officielles Zabbix 6.4 avec une base de données MySQL 8.0.
Les agents sont configurés pour utiliser des **Active Checks** afin d'optimiser la remontée des données en temps réel.


## 📸 Screenshots clés
| Figure | Description |
| --- | --- |
**Infrastructure** | Vue des 3 instances EC2 "Running" avec tags 
**Docker** | Liste des conteneurs actifs (`zabbix-web`, `server`, `mysql`) 
**Connectivité** | Statut **ZBX** vert pour les clients Linux et Windows 
**Dashboard** | Vue globale avec alertes actives (Current Problems) 
---


## 🔍 Troubleshooting
* **Network Unreachable** : Vérifier que la table de routage (`0.0.0.0/0`) est correctement associée au subnet.
* **Agent non disponible** : Vérifier que les Security Groups autorisent bien les flux entre l'IP privée du serveur et les agents.
* **Expiration Lab** : En cas de redémarrage, relancer les conteneurs avec `docker-compose up -d` pour restaurer les services via les volumes persistants .


## 👤 Auteur
* **Étudiant** : elouafi abderrahmane
* **Encadrant** : Prof. Azeddine KHIAT
* **Année** : 2025/2026
