# Récupérer le résultat de la fonction
playerctl status > /dev/null 2> /dev/null 
if [ $? -eq 0 ]; then
    echo "Des lecteurs sont disponibles avec playerctl."
else
    echo "Aucun lecteur n'est disponible avec playerctl."
fi
