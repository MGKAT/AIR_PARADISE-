# AIR PARADISE - Chatbot de Réservation de Vols 

Un chatbot intelligent pour la réservation de vols domestiques aux États-Unis, combinant Laravel, JavaScript et des modèles ML (FAISS/XGBoost).

## Fonctionnalités Clés

- **Recherche intelligente** de vols avec suggestions de villes
- **Prédiction de prix** en temps réel via XGBoost
- **Interface conversationnelle** intuitive
- **Processus complet** de réservation
- **Historique** des recherches sauvegardé

## Architecture Technique 

    A[Frontend: JavaScript] -->|API| B[Backend: Laravel]
    B -->|MySQL| C[(Base de Données)]
    A -->|Requêtes| D[API ML: Flask/FAISS/XGBoost]

## Prérequis
PHP 8.0+
Composer
Python 3.8+
Node.js 16+
MySQL 5.7+

## Installation 
- **lancement du projet**:
composer create-project laravel/laravel air-paradise-chabot
cd air-paradise-chabot
php serve artisan

- **Configurer .env avec vos accès MySQL:**
mysql -u [root] -p [laravel] < [chemin/vers/laravel.sql]
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=

- **API Machine Learning**
cd faiss_python 
pip install -r requirements.txt
python city_embedding.py

Accédez à l'application sur: http://localhost:8000

- **Configuration des Services**
Frontend	http://localhost:8000	8000
API Laravel	http://localhost:8000/api	8000
API ML	http://localhost:5000	5000
MySQL	localhost	3306

## Licence 
Ce projet est sous licence ecole it

## Auteur
- OLIVIER DYLAN WAFO
- ALLAL KLEIN FONGANG TENE