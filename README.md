#  Air Paradise – Flight Price Prediction & Intelligent Chatbot

## Description
Air Paradise est un projet académique combinant **Intelligence Artificielle** et **développement web**.  
L’objectif est de prédire le prix des vols aériens et de fournir une interface interactive permettant de rechercher, comparer et réserver un vol de manière intelligente.

Ce projet s’appuie sur :
-  **Machine Learning (XGBoost, Scikit-learn, TensorFlow)** pour la prédiction des prix
-  **Base de données MySQL** pour la gestion des informations
-  **FastAPI/Flask** pour exposer une API ML
-  **Frontend (Angular + Laravel)** pour l’interface utilisateur

---

##  Fonctionnalités
-  Nettoyage et analyse de données réelles (dataset Kaggle + preprocessing maison)
-  Modélisation avec **XGBoost optimisé** et recherche d’hyperparamètres
-  Recherche de vols similaires avec **FAISS (similarité vectorielle)**
-  Estimation du prix en temps réel
-  Chatbot intelligent pour guider l’utilisateur dans la réservation
-  Interface web interactive (Angular + Laravel) reliée à l’API Python

---

##  Technologies utilisées
### Backend ML
- Python 3.x
- Pandas, Numpy, Scikit-learn, XGBoost
- FAISS
- Flask / FastAPI
- Joblib

### Backend Web
- PHP 8.x
- Laravel 12.x
- MySQL / MariaDB

### Frontend
- Angular
- Bootstrap

---

##  Structure du projet
air-paradise/
│── backend-ml/ # API Python (FastAPI/Flask) + modèle ML
│── laravel-backend/ # Backend Laravel (routes, API, connexion DB)
│── frontend/ # Interface Angular
│── notebooks/ # Notebooks Kaggle (nettoyage + modélisation)
│── documentation/ # PDF et docs du projet
│── README.md # Présentation du projet


---

##  Installation & Lancement
### 1. API ML (Python)
```bash
cd backend-ml
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python app.py
 API disponible sur http://127.0.0.1:5000
```
2. Backend Laravel
```bash
Copier
Modifier
cd laravel-backend
composer install
copy .env.example .env
php artisan key:generate
php artisan serve
 Serveur Laravel dispo sur http://127.0.0.1:8000
```
3. Frontend Angular
```bash
Copier
Modifier
cd frontend
npm install
ng serve
 Interface sur http://localhost:4200
```
 Résultats (Machine Learning)
 MAE (baseline XGBoost) : 133.33

 MAE (XGBoost optimisé) : 133.78

 Pas d'amélioration après hyperparamétrage et RandomizedSearch
