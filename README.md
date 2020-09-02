# Les-pays-en-chiffre

## Description
Réalisation du brief "Les Pays en Chiffre". Création de fonctions, procédures et triggers pour interroger une base de données hébergée en mode SaaS avec postgresql.

## Prérequis
Ouvrir une instance [postgresql](https://www.postgresql.fr/).

## Installation
Remplir la base de données en exécutant `filtered-countries.sql`.  
Ajouter les fonctions et procédures en exécutant `fonctions-procedures.sql`.  
Installer le trigger en exécutant `Trigger.sql`.

## Utilisation
### insert_country
La procédure `insert_country()` crée dans la base de données un nouveau pays fictif possédant une population et une densité fictives, puis calcule une superficie cohérente à ces données. 
Pour créer un nouveau pays, utiliser la procédure avec la commande :
``` sql
CALL insert_country('<pays>');
```  
### viewcountry(<param>)
La fonction `viewcountry()` retourne le pays (sous format de TABLE) qui correspond au critère passé en paramètre. Ce paramètre est le nom du pays.
Pour visualiser un pays, utiliser la fonction avec la commande :
``` sql
SELECT * FROM viewcountry('<pays>');
```
### density_range(<param>)
La fonction `density_range()` retourne le pays dont le nom est donné en paramètres et indique sa catégorie selon la densité de population. Les pays sont regroupés par 4 tranches : *densément peuplés*, *densité intermédiaire*, *peu denses*, *très peu denses*.
Pour trouver la tranche d'un pays, utiliser la fonction avec la commande :
``` sql
SELECT * FROM density_range('<pays>');
```

