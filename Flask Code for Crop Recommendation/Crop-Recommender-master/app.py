# flask app for crop recommendation


from flask import Flask, request, jsonify
import pickle

app = Flask(__name__)

with open('Crop_Recommendation.pkl', 'rb') as file:
    model, label_encoder = pickle.load(file)

@app.route('/')
def home():
    return "Welcome to the Crop Recommendation System!"

@app.route('/predict', methods=['POST'])
def predict():
    if request.is_json:

        data = request.get_json()
        N = data['N']
        P = data['P']
        K = data['K']
        temperature = data['temperature']
        humidity = data['humidity']
        ph = data['ph']
        rainfall = data['rainfall']

        input_features = [N, P, K, temperature, humidity, ph, rainfall]
        prediction_encoded = model.predict([input_features])
        prediction = label_encoder.inverse_transform(prediction_encoded)

        return jsonify({'prediction': prediction[0]})
    else:
        return jsonify({"error": "Unsupported Media Type"}), 415

if __name__ == '__main__':
    app.run(debug=True)
