# Ouverture du port pour le serveur Zabbix
New-NetFirewallRule -DisplayName "Zabbix Agent" -Direction Inbound -Protocol TCP -LocalPort 10050 -Action Allow

# Vérification du service
Get-Service "Zabbix Agent 2"
Write-Host "Le pare-feu Windows a été configuré pour Zabbix."