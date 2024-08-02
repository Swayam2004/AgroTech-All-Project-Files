import 'dart:ui';
import 'package:flutter/material.dart';

const openWeatherApiKey = 'c0e54e9d9a08a96546f84b04e121ee8c';

const themeColor = Color(0xff4A6B3E);
const themeColor1 = Color(0xffA2C392);
const themeColor2 = Color(0xffCFEBC1);
const themeColor3 = Color(0xffCFF3BE);

//Location
const String location = "S Block 17, Bodhanga, Cuttack-08..";

class Weather {
  final String windSpeed;
  final String precipitation;
  final String sunriseSunset;
  final String humidity;
  final String uvIndex;
  final String moonPhase;
  final String dewPoint;
  final String visibility;

  Weather({
    required this.windSpeed,
    required this.precipitation,
    required this.sunriseSunset,
    required this.humidity,
    required this.uvIndex,
    required this.moonPhase,
    required this.dewPoint,
    required this.visibility,
  });
}

class Parameter {
  final List<Weather> sign;
  final List<Weather>? name;
  final List<Weather> value;
  final List<Weather>? unit;

  Parameter(
    this.sign,
    this.name,
    this.value,
    this.unit,
  );
}

// final List<Map<>> demo = [
//
//
//
//
// ];

final List<String> recommendCrops = [
  'rice',
  'maize',
  'chickpea',
  'kidneybeans',
  'pigeonpeas',
  'mothbeans',
  'mungbean',
  'blackgram',
  'lentil',
  'pomegranate',
  'banana',
  'mango',
  'grapes',
  'watermelon',
  'muskmelon',
  'apple',
  'orange',
  'papaya',
  'coconut',
  'cotton',
  'jute',
  'coffee',
];

final Map<String, dynamic> cropDescriptions = {
  'recommendations appear here':
      'Description for the recommended crops appear here',
  'rice': 'Ideal for nitrogen-rich soil and moderate temperature.',
  'maize': 'Thrives in well-drained, fertile soil and warm temperatures.',
  'chickpea': 'Requires well-drained, loamy soil and a cool climate.',
  'kidneybeans': 'Grows best in well-drained soil and moderate temperatures.',
  'pigeonpeas': 'Thrives in well-drained soil and warm temperatures.',
  'mothbeans': 'Prefers sandy, well-drained soil and warm temperatures.',
  'mungbean': 'Grows well in sandy, well-drained soil and warm temperatures.',
  'blackgram': 'Requires well-drained, loamy soil and warm temperatures.',
  'lentil': 'Grows well in well-drained, loamy soil and cool temperatures.',
  'pomegranate': 'Prefers well-drained, sandy soil and a warm climate.',
  'banana': 'Thrives in well-drained soil and high humidity.',
  'mango': 'Requires well-drained soil and a warm, tropical climate.',
  'grapes': 'Needs well-drained soil and a warm, dry climate.',
  'watermelon': 'Prefers sandy, well-drained soil and warm temperatures.',
  'muskmelon': 'Grows best in sandy, well-drained soil and warm temperatures.',
  'apple': 'Thrives in well-drained soil and a temperate climate.',
  'orange': 'Requires well-drained soil and a warm, sunny climate.',
  'papaya': 'Prefers well-drained soil and a warm, tropical climate.',
  'coconut': 'Needs sandy, well-drained soil and high humidity.',
  'cotton': 'Grows well in black soil with warm temperatures.',
  'jute': 'Requires warm, humid climate and well-drained, loamy soil.',
  'coffee': 'Prefers well-drained soil and a cool, tropical climate.',
};

final List<String> optimizeCrops = [
  'Arhar/Tur',
  'Groundnut',
  'Maize',
  'Paddy',
  'Ragi',
  'Sesamum',
  'Urad',
  'Wheat',
  'Potato',
  'Horse-gram',
  'Sugarcane',
  'Moong(Green Gram)',
  'Rice',
  'Rapeseed &Mustard',
  'Castor seed',
  'Cotton(lint)',
  'Dry chillies',
  'Dry ginger',
  'Mesta',
  'Small millets',
  'Sweet potato',
  'Turmeric',
  'Coriander',
  'Garlic',
  'Gram',
  'Niger seed' 'Sunflower',
  'Onion',
  'Sannhamp',
  'Tobacco' 'Other Kharif pulses',
  'Other Rabi pulses',
  'Safflower',
  'Jute',
  'Jowar',
  'Linseed',
  'Masoor',
  'Bajra',
  'Soyabean',
  'Khesari',
  'Oilseeds total',
  'Arecanut',
  'Coconut',
  'Pulses total',
  'Peas & beans (Pulses)',
  'Barley',
  'Cardamom',
  'Moth'
];

final List<String> season = [
  'Summer',
  'Autumn',
  'Winter',
  'Rabi',
  'Kharif',
  'Whole Year'
];

final List<String> states = [
  'Odisha',
  'West Bengal',
];
