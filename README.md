# Les-pays-en-chiffre

## Description
Réalisation du brief "Les Pays en Chiffre". Création de fonctions, procédures et triggers pour interroger une base de données hébergée en mode SaaS avec postgresql.

## Installation
Remplir la base de données en exécutant `filtered-countries.sql`.  
Ajouter les fonctions et procédures en exécutant `fonctions-procedures.sql`.  
Installer le trigger en exécutant `Trigger.sql`.

## Utilisation
Pour créer un nouveau pays, utiliser la fonction `insert_country()` par la commande `CALL insert_country('nom du pays');`  
Pour visualiser un pays, utiliser la fonction `viewcountry()` par la commande `SELECT * FROM viewcountry('nom du pays');`  
Pour utiliser les catégories de densité de population, utiliser la fonction `density_range()` par la commande `SELECT * FROM density_range('nom du pays');`

## Prérequis
Ouvrir une instance postgresql.
