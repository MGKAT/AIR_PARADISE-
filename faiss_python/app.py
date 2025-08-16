from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
import joblib
import faiss
from model_loader import load_models
from faiss_index import create_faiss_index

app = Flask(__name__)

# Charger les modèles et les mappings
xgb_model, encoder, airline_mapping, origin_mapping, destination_mapping = load_models()

# Charger les données et créer l'index FAISS
flight_data, faiss_index = create_faiss_index()

@app.route('/predict_price', methods=['POST'])
def predict_price():
    data = request.json
    
    # Convertir l'heure en minutes
    def convert_time(time_str):
        hours, minutes = map(int, time_str.split(":"))
        return hours * 60 + minutes
    
    # Récupérer la distance
    def get_distance(origin, destination):
        encoded_origin = origin_mapping[origin]
        encoded_destination = destination_mapping[destination]
        matching_rows = flight_data[
            (flight_data['ORIGIN_AIRPORT'] == encoded_origin) & 
            (flight_data['DESTINATION_AIRPORT'] == encoded_destination)
        ]
        return matching_rows.iloc[0]['DISTANCE'] if not matching_rows.empty else None
    
    try:
        distance = get_distance(data['origin'], data['destination'])
        if distance is None:
            return jsonify({"error": "Distance non trouvée"}), 400
        
        # Préparer l'input pour le modèle
        input_df = pd.DataFrame({
            'DISTANCE': [distance],
            'AIRLINE': [airline_mapping[data['airline']]],
            'MONTH': [data['month']],
            'DAY_OF_WEEK': [data['day_of_week']],
            'SCHEDULED_DEPARTURE': [convert_time(data['departure_time'])],
            'ORIGIN_AIRPORT': [origin_mapping[data['origin']]],
            'DESTINATION_AIRPORT': [destination_mapping[data['destination']]]
        })
        
        # Faire la prédiction
        predicted_price = xgb_model.predict(input_df)[0]
        
        # Recherche de vols similaires avec FAISS
        encoded_origin = origin_mapping[data['origin']]
        encoded_destination = destination_mapping[data['destination']]
        query_vector = np.array([[encoded_origin, encoded_destination, data['month'], data['day_of_week']]], dtype='float32')
        D, I = faiss_index.search(query_vector, k=3)
        
        similar_flights = []
        for idx, distance in zip(I[0], D[0]):
            flight = flight_data.iloc[idx]
            similar_flights.append({
                'origin': flight['ORIGIN_AIRPORT'],
                'destination': flight['DESTINATION_AIRPORT'],
                'price': flight['PRICE'],
                'distance': float(distance)
            })
        
        return jsonify({
            'predicted_price': round(predicted_price, 2),
            'similar_flights': similar_flights
        })
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)