import 'dart:convert';
import 'package:http/http.dart' as http;

final List<String> crop = [
  'Rice',
  'Maize',
  'Coffee',
  'Jute',
  'Cotton',
  'Coconut',
  'Papaya',
  'Orange',
  'Apple',
  'Muskmelon',
  'Watermelon',
  'Grapes',
  'Mango',
  'Banana',
  'Pomegranate',
  'Lentil',
  'Chickpea',
  'Pigeonpeas',
  'Mothbeans',
  'Mungbean',
  'Blackgram'
];

Future<Map<String, dynamic>> fetchCropRecommendation(
    Map<String, dynamic> features) async {
  const url = 'https://crop-recommender-agrotech.onrender.com/predict';
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "N": features["N"],
      "P": features["P"],
      "K": features["K"],
      "temperature": features["temperature"],
      "humidity": features["humidity"],
      "rainfall": features["rainfall"],
      "ph": features["ph"],
    }),
  );

  print(jsonEncode({
    "N": features["N"],
    "P": features["P"],
    "K": features["K"],
    "temperature": features["temperature"],
    "humidity": features["humidity"],
    "rainfall": features["rainfall"],
  }));
  print(response.body);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load prediction');
  }
}

Future<Map<String, dynamic>> fetchYieldOptimizationResult(
    Map<String, dynamic> features) async {
  const url = 'https://yield-predictor-agro-tech.onrender.com/predict';
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "Area": features["Area"],
      "Production": features["Production"],
      "Crop_Type": features["Crop_Type"],
      "Season": features["Season"],
      "State": features["State"]
    }),
  );

  print({
    "Area": features["Area"],
    "Production": features["Production"],
    "Crop_Type": features["Crop_Type"],
    "Season": features["Season"],
    "State": features["State"]
  });
  print(response.body);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load prediction');
  }
}
