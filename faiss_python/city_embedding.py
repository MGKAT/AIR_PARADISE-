from flask import Flask, request, jsonify
from sentence_transformers import SentenceTransformer
import faiss
import joblib
import numpy as np
import pandas as pd
from flask_cors import CORS

app = Flask(__name__) 
CORS(app, origins=["http://localhost:8000"])


# Charger les villes
df = pd.read_csv("data/cities.csv")  # Assure-toi que le fichier contient une colonne 'city'
cities = df['city'].tolist()
# =========================
# Charger le modèle et les données
# =========================
flight_data = pd.read_csv("data/flight_data_nettoye.csv")

xgb_model = joblib.load("models/final_xgb_model.pkl")
encoder = joblib.load("models/encoder.pkl")

# Encoder mappings
airline_mapping = {cat: idx for idx, cat in enumerate(encoder.categories_[0])}
origin_mapping = {cat: idx for idx, cat in enumerate(encoder.categories_[1])}
destination_mapping = {cat: idx for idx, cat in enumerate(encoder.categories_[2])}

# Inverses pour affichage si besoin
origin_inverse = {v: k for k, v in origin_mapping.items()}
destination_inverse = {v: k for k, v in destination_mapping.items()}

# Mapping ville → IATA
city_to_iata = {
    "anchorage": "ANC", "los angeles": "LAX", "san francisco": "SFO", "seattle": "SEA",
    "las vegas": "LAS", "denver": "DEN", "salt lake city": "SLC", "portland": "PDX",
    "fairbanks": "FAI", "minneapolis": "MSP", "phoenix": "PHX", "san juan": "SJU",
    "plattsburgh": "PBG", "niagara falls": "IAG", "ponce": "PSE", "aguadilla": "BQN",
    "chicago": "ORD", "spokane": "GEG", "honolulu": "HNL", "ontario": "ONT",
    "orlando": "MCO", "boston": "BOS", "new york": "JFK", "philadelphia": "PHL",
    "washington": "IAD", "atlanta": "ATL", "dallas": "DFW", "houston": "IAH",
    "miami": "MIA", "fort lauderdale": "FLL", "detroit": "DTW", "charlotte": "CLT",
    "baltimore": "BWI", "newark": "EWR", "st louis": "STL", "nashville": "BNA",
    "memphis": "MEM", "tampa": "TPA", "jacksonville": "JAX", "pittsburgh": "PIT",
    "cleveland": "CLE", "cincinnati": "CVG", "indianapolis": "IND", "kansas city": "MCI",
    "austin": "AUS", "san diego": "SAN", "sacramento": "SMF", "san jose": "SJC",
    "burbank": "BUR", "long beach": "LGB", "raleigh": "RDU", "oklahoma city": "OKC",
    "new orleans": "MSY", "el paso": "ELP", "albuquerque": "ABQ", "tucson": "TUS",
    "boise": "BOI", "omaha": "OMA"
}

# Fonctions utilitaires
def get_encoded_airport_from_city(city_name, mapping_dict):
    iata = city_to_iata.get(city_name.lower().strip())
    if iata is None:
        print(f" Ville inconnue : {city_name}")
        return None
    return mapping_dict.get(iata)

def get_distance_from_dataframe(df, origin, destination):
    matching_rows = df[
        (df['ORIGIN_AIRPORT'] == origin) &
        (df['DESTINATION_AIRPORT'] == destination)
    ]
    if not matching_rows.empty:
        return matching_rows.iloc[0]['DISTANCE']
    return None

def convert_time_to_minutes(time_str):
    hours, minutes = map(int, time_str.split(":"))
    return hours * 60 + minutes

def prepare_input(user_origin, user_destination, user_airline, distance, month, day_of_week, scheduled_departure):
    return pd.DataFrame({
        "DISTANCE": [distance],
        "AIRLINE": [airline_mapping[user_airline]],
        "MONTH": [month],
        "DAY_OF_WEEK": [day_of_week],
        "SCHEDULED_DEPARTURE": [scheduled_departure],
        "ORIGIN_AIRPORT": [user_origin],
        "DESTINATION_AIRPORT": [user_destination]
    })
    
# Générer les embeddings
model = SentenceTransformer("all-MiniLM-L6-v2")
embeddings = model.encode(cities, convert_to_numpy=True)
faiss.normalize_L2(embeddings)

# Index FAISS
d = embeddings.shape[1]
index = faiss.IndexFlatL2(d)
index.add(embeddings)
print(f"{len(cities)} villes indexées.")

@app.route("/search", methods=["POST"])
def search_city():
    data = request.get_json()
    query = data.get("query", "")
    top_k = int(data.get("top_k", 1))

    if not query:
        return jsonify({"error": "query is required"}), 400

    # Embedding de la requête
    query_emb = model.encode([query], convert_to_numpy=True)
    faiss.normalize_L2(query_emb)

    # Recherche
    distances, indices = index.search(query_emb, top_k)
    results = [{"city": cities[i], "distance": float(d)} for i, d in zip(indices[0], distances[0])]

    return jsonify(results)

    
@app.route("/searchPrice", methods=["POST"])
def search_price():
    data = request.get_json()
    origin_city = data.get("departure")
    destination_city = data.get("arrival_city")

    if not origin_city or not destination_city:
        return jsonify({"error": "Champs 'departure' et 'arrival_city' requis"}), 400

    # Encodage des aéroports
    user_origin = get_encoded_airport_from_city(origin_city, origin_mapping)
    user_destination = get_encoded_airport_from_city(destination_city, destination_mapping)

    if user_origin is None or user_destination is None:
        return jsonify({"error": "Ville inconnue"}), 400

    # Données simulées 
    user_month = 7
    user_day_of_week = 4
    scheduled_departure = convert_time_to_minutes("08:00")
    user_airline = "AS"  # compagnie par défaut

    # Distance depuis le dataset
    distance = get_distance_from_dataframe(flight_data, user_origin, user_destination)

    if distance is None:
        distance = 1500  # distance estimée

    # Préparation des features
    X_input = prepare_input(
        user_origin=user_origin,
        user_destination=user_destination,
        user_airline=user_airline,
        distance=distance,
        month=user_month,
        day_of_week=user_day_of_week,
        scheduled_departure=scheduled_departure
    )

    # Prédiction
    predicted_price = float(xgb_model.predict(X_input)[0])

    # print(f"Calcul du prix entre : {origin_city} -> {destination_city}  {predicted_price}")
    return jsonify({"price": round(predicted_price, 2)})
   


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
