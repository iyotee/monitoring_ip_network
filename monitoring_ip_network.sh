#!/bin/bash

subnet="192.168.1"

# Vérifier si nmap est installé, sinon tenter de l'installer
if ! command -v nmap &> /dev/null; then
    echo "nmap n'est pas installé. Tentative d'installation..."
    sudo apt-get update
    sudo apt-get install nmap -y
    if ! command -v nmap &> /dev/null; then
        echo "L'installation de nmap a échoué. Veuillez l'installer manuellement."
        exit 1
    fi
fi

# Fonction pour gérer le signal Ctrl+C
trap ctrl_c INT

function ctrl_c() {
    echo "Interruption détectée. Arrêt du script."
    exit 1
}

echo "Début de la recherche des adresses IP actives..."

# Trouver les adresses IP actives avec noms de périphériques
active_devices=()
for ((i=1; i<=254; i++)); do
    ip="${subnet}.${i}"
    echo -n "Vérification de ${ip}... "
    if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
        name=$(nmap -sP "$ip" | grep 'for' | awk '{print $5}')
        echo "actif - Périphérique : $name"
        active_devices+=("$ip - $name")
    else
        echo "inactif"
    fi
done

# Afficher la plage occupée
echo "Recherche terminée."
if [ ${#active_devices[@]} -gt 0 ]; then
    echo "Périphériques actifs trouvés :"
    for device in "${active_devices[@]}"; do
        echo "$device"
    done
else
    echo "Aucun périphérique actif trouvé."
fi
