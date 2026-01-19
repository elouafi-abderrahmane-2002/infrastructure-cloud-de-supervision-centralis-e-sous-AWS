#!/bin/bash

# Navigation vers le dossier du projet
echo "Accès au répertoire zabbix-stack..."
cd ~/zabbix-stack

# Lancement de l'infrastructure Docker
echo "Démarrage des conteneurs Zabbix (MySQL, Server, Web)..."
sudo docker-compose up -d

# Attente de quelques secondes pour l'initialisation
sleep 2

# Affichage du statut final
echo "Vérification du statut des conteneurs :"
sudo docker ps [cite: 1013]

echo "--------------------------------------------------"
echo "Infrastructure prête ! Accédez à l'interface via l'IP publique."