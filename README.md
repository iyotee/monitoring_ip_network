# monitoring_ip_network
 Description du Programme :

Ce script Bash permet de détecter les adresses IP actives sur un réseau local (192.168.1.x) avec un masque de sous-réseau 255.255.255.0. Le script utilise la commande ping pour vérifier la connectivité des adresses IP et récupère les noms de périphériques correspondants à l'aide de la commande nmap. Les adresses IP actives sont affichées avec leurs noms associés, le cas échéant. Le script gère également les interruptions par Ctrl+C pour une sortie propre.

#Fonctionnalités :

Détecte les adresses IP actives sur le réseau local.
Utilise la commande ping pour vérifier la connectivité.
Récupère les noms de périphériques associés aux adresses IP à l'aide de nmap.
Affiche les adresses IP actives avec les noms des périphériques.
Gère les interruptions par Ctrl+C pour une sortie propre.

#Utilisation :

Assurez-vous que le programme nmap est installé sur votre système.
Exécutez le script en tant qu'exécutable : ./nom_du_script.sh.
Note : Si nmap n'est pas installé, le script tentera de l'installer automatiquement. En cas d'échec, une installation manuelle de nmap est requise..
