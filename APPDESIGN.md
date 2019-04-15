# App brainstorming : 

## APP 1 :  
Une appli pour enregistrer des paris pour les compétitions de foot internationales (sans argent bien sur) avec un classement, réservé aux employés

## API serveur pour synchroniser les résultats avec la DB: 
https://www.football-data.org/documentation/quickstart

## Tech :
- design pattern typique microservices
- orchestration swarm (cloud ctg) ou kubernetes : google cloud ou aws
- techno DB : prob postgres.
- intégration continue via gitlab, interne ctg ou public
- app écrite en flutter : build pour ios et android

## principes : 
- app diffusée sur app stores/play store

## fonctionnalités:
Système d'enregistrement / authentification : confirmation par email, réservé aux employés (détecté par l'adresse @ctg.lu)

### authentification
choisir une équipe favorite pour la compétition après l'enregistrement, option non modifiable en cours de compétition
paramètrer les notifications

### Page des matchs du jour :
page avec les matchs du jour à venir ou journée en cours (comme l'appli STRAFE pour les matchs esport)

### Page d'un match a venir :
parier sur chaque match avec un bouton "vote"
afficher le nombre de paris pour chaque équipe apres que l'utilisateur ait parié

### Page des matchs passés : 
liste des matchs et score avec : +3 +1 0 en fonction du résultats

### Page des classements : 
affiche votre classement, ainsi que les 5 premiers

### Page de fin de compétition : 
récapitulatif, bonus pour équipe favorite bien placée, partager ses résutats etc...

### Page A propos : info sur le staff meeting ou aura lieu la remise de prix pour les vainqueurs


## links technos / design patterns : 
 - https://matthewminer.com/2015/02/21/pattern-for-async-task-queue-results.html
 - Boilerplate pour flask : https://github.com/cosmic-byte/flask-restplus-boilerplate
