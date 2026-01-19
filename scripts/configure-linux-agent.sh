#!/bin/bash
# Installation du dépôt Zabbix 6.4
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb
sudo apt update

# Installation de l'agent 2
sudo apt install -y zabbix-agent2 zabbix-agent2-plugin-*

# Activation du service
sudo systemctl enable zabbix-agent2
sudo systemctl start zabbix-agent2
echo "Installation de l'agent Linux terminée."