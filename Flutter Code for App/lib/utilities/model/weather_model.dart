class WeatherModel {
  // Current weather conditions
  String? _condition; // e.g. "Sunny", "Cloudy", "Rainy", etc.
  int? _temperature; // in Celsius
  int? _humidity; // in percentage
  int? _windSpeed; // in km/h
  double? _precipitation; // in percentage
  int? _uvIndex; // UV index
  String? _sunrise; // sunrise time in 24-hour format (e.g. "06:30")
  String? _sunset; // sunset time in 24-hour format (e.g. "18:30")
  String? _moonPhase; // e.g. "New Moon", "Full Moon", etc.
  int? _visibility; // in km
  double? _dewPoint; // in Celsius

  // Forecast data
  List<Forecast>? _forecast;

  // Constructor with dummy data
  WeatherModel() {
    _condition = "Sunny";
    _temperature = 22;
    _humidity = 60;
    _windSpeed = 15;
    _precipitation = 0.0;
    _uvIndex = 5;
    _sunrise = "06:30";
    _sunset = "18:30";
    _moonPhase = "Waxing Crescent";
    _visibility = 10;
    _dewPoint = 10.0;

    _forecast = [
      Forecast(
        date: "2023-03-01",
        condition: "Cloudy",
        temperature: 20,
        humidity: 70,
        windSpeed: 10,
        precipitation: 2.0,
        uvIndex: 4,
        sunrise: "06:25",
        sunset: "18:35",
        moonPhase: "First Quarter",
        visibility: 8,
        dewPoint: 12.0,
      ),
      Forecast(
        date: "2023-03-02",
        condition: "Rainy",
        temperature: 18,
        humidity: 80,
        windSpeed: 20,
        precipitation: 10.0,
        uvIndex: 3,
        sunrise: "06:20",
        sunset: "18:40",
        moonPhase: "Waxing Gibbous",
        visibility: 5,
        dewPoint: 14.0,
      ),
      Forecast(
        date: "2023-03-03",
        condition: "Sunny",
        temperature: 25,
        humidity: 50,
        windSpeed: 15,
        precipitation: 0.0,
        uvIndex: 6,
        sunrise: "06:30",
        sunset: "18:30",
        moonPhase: "Full Moon",
        visibility: 12,
        dewPoint: 10.0,
      ),
    ];
  }

  // Getters for current weather conditions
  String? get condition => _condition;
  int? get temperature => _temperature;
  int? get humidity => _humidity;
  int? get windSpeed => _windSpeed;
  double? get precipitation => _precipitation;
  int? get uvIndex => _uvIndex;
  String? get sunrise => _sunrise;
  String? get sunset => _sunset;
  String? get moonPhase => _moonPhase;
  int? get visibility => _visibility;
  double? get dewPoint => _dewPoint;

  // Getter for forecast data
  List<Forecast>? get forecast => _forecast;
}

class Forecast {
  final String _date;
  final String _condition;
  final int _temperature;
  final int _humidity;
  final int _windSpeed;
  final double _precipitation;
  final int _uvIndex;
  final String _sunrise;
  final String _sunset;
  final String _moonPhase;
  final int _visibility;
  final double _dewPoint;

  Forecast({
    required String date,
    required String condition,
    required int temperature,
    required int humidity,
    required int windSpeed,
    required double precipitation,
    required int uvIndex,
    required String sunrise,
    required String sunset,
    required String moonPhase,
    required int visibility,
    required double dewPoint,
  })  : _date = date,
        _condition = condition,
        _temperature = temperature,
        _humidity = humidity,
        _windSpeed = windSpeed,
        _precipitation = precipitation,
        _uvIndex = uvIndex,
        _sunrise = sunrise,
        _sunset = sunset,
        _moonPhase = moonPhase,
        _visibility = visibility,
        _dewPoint = dewPoint;

  //Getters for forecast data
  String get date => _date;
  String get condition => _condition;
  int get temperature => _temperature;
  int get humidity => _humidity;
  int get windSpeed => _windSpeed;
  double get precipitation => _precipitation;
  int get uvIndex => _uvIndex;
  String get sunrise => _sunrise;
  String get sunset => _sunset;
  String get moonPhase => _moonPhase;
  int get visibility => _visibility;
  double get dewPoint => _dewPoint;
}