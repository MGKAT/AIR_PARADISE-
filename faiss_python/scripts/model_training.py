import pandas as pd
import numpy as np
import joblib
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OrdinalEncoder
import xgboost as xgb

# 1. Charger les données
df = pd.read_csv('data/flight_data_nettoye.csv')

# 2. Colonnes à encoder
cat_features = ['AIRLINE', 'ORIGIN_AIRPORT', 'DESTINATION_AIRPORT']
encoder = OrdinalEncoder()
df[cat_features] = encoder.fit_transform(df[cat_features])

# 3. Sauvegarder l’encoder
joblib.dump(encoder, 'models/encoder.pkl')
print("Encoder sauvegardé sous encoder.pkl")

# 4. Définir les features et la cible
features = ['DISTANCE', 'AIRLINE', 'MONTH', 'DAY_OF_WEEK', 'SCHEDULED_DEPARTURE', 'ORIGIN_AIRPORT', 'DESTINATION_AIRPORT']
X = df[features]
y = df['PRICE']

# 5. Séparer en train/test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 6. Entraîner le modèle XGBoost
model = xgb.XGBRegressor(n_estimators=100, max_depth=5, learning_rate=0.1)
model.fit(X_train, y_train)

# 7. Sauvegarder le modèle
joblib.dump(model, 'models/final_xgb_model.pkl')
print(" Modèle XGBoost sauvegardé sous final_xgb_model.pkl")
