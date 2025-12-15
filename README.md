# Alioune

Ce projet présente une simulation du mouvement d’un projectile en Julia, où le moteur de calcul physique est implémenté dans le sous-module Engine du module principal Alioune, tandis que l’affichage est géré séparément dans le dossier ui. Le résultat s’obtient en exécutant l’application depuis le dossier du projet avec la commande
julia --project=. ui/app.jl,
qui calcule la trajectoire et génère le graphique correspondant. Ce travail constitue une base fonctionnelle pouvant être améliorée ultérieurement par l’ajout d’une interface graphique utilisateur interactive.