# flask app for crop yield prediction

from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

model = joblib.load('Yield_Prediction.pkl')

with open('original_columns.pkl', 'rb') as f:
    original_columns = joblib.load(f)

@app.route('/')
def home():
    return "Welcome to the Crop Yield Prediction System!"

@app.route('/predict', methods=['POST'])
def predict():
    if request.is_json:
        data = request.get_json()

        Area = data['Area']
        Production = data['Production']
        Crop_Type = data['Crop_Type']
        Season = data['Season']
        State = data['State']

        input_data = pd.DataFrame([{
            'Area': Area,
            'Production': Production,
            'Crop_Type': Crop_Type,
            'Season': Season,
            'State': State
        }])

        input_data = pd.get_dummies(input_data)

        input_data = input_data.reindex(columns=original_columns, fill_value=0)

        prediction = model.predict(input_data)[0]

        prediction = float(prediction)

        return jsonify({'prediction': prediction})
    else:
        return jsonify({"error": "Unsupported Media Type"}), 415

if __name__ == '__main__':
    app.run(debug=True)
