import 'dart:convert';
import 'dart:developer';
import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherTab extends StatefulWidget {
  const WeatherTab({super.key});

  @override
  State<WeatherTab> createState() => _WeatherTabState();
}

class _WeatherTabState extends State<WeatherTab> {
  dynamic _weatherData;

  @override
  void initState() {
    fetchWeather(20.2757784, 85.7762864);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              themeColor, // Start color
              themeColor2, // End color
              themeColor
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Current Weather',
                  style: TextStyle(
                    color: themeColor2,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: themeColor2.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  (_weatherData == null)
                                      ? '0°'
                                      : '${_weatherData['current']['temperature_2m']}°',
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  Icons.cloud,
                                  size: 48,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                            Text(
                              'High: ${(_weatherData == null) ? '0°' : '${_weatherData['daily']['temperature_2m_max'][0]}'}° Low: ${(_weatherData == null) ? '0°' : '${_weatherData['daily']['temperature_2m_min'][0]}'}°',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cloudy',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Feels like 31°',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: ElevatedButton(
                //         onPressed: () {},
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: themeColor1,
                //           padding: const EdgeInsets.symmetric(vertical: 16),
                //           textStyle: const TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //           ),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //           ),
                //         ),
                //         child: const Text(
                //           'Today',
                //           style: TextStyle(color: themeColor),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 16),
                //     // Expanded(
                //     //   child: ElevatedButton(
                //     //     onPressed: () {},
                //     //     style: ElevatedButton.styleFrom(
                //     //       backgroundColor: themeColor2,
                //     //       padding: const EdgeInsets.symmetric(
                //     //         vertical: 16,
                //     //       ),
                //     //       textStyle: const TextStyle(
                //     //         fontSize: 16,
                //     //         fontWeight: FontWeight.bold,
                //     //       ),
                //     //       shape: RoundedRectangleBorder(
                //     //         borderRadius: BorderRadius.circular(16),
                //     //       ),
                //     //     ),
                //     //     child: const Text('Tomorrow'),
                //     //   ),
                //     // ),
                //     // const SizedBox(width: 16),
                //     //   Expanded(
                //     //     child: ElevatedButton(
                //     //       onPressed: () {},
                //     //       style: ElevatedButton.styleFrom(
                //     //         backgroundColor: themeColor2,
                //     //         padding: const EdgeInsets.symmetric(
                //     //           vertical: 16,
                //     //         ),
                //     //         textStyle: const TextStyle(
                //     //           fontSize: 16,
                //     //           fontWeight: FontWeight.bold,
                //     //         ),
                //     //         shape: RoundedRectangleBorder(
                //     //           borderRadius: BorderRadius.circular(16),
                //     //         ),
                //     //       ),
                //     //       child: const Text('10 Days'),
                //     //     ),
                //     //   ),
                //   ],
                // ),
                // const SizedBox(height: 16),
                Row(
                  children: [
                    CustomBox(
                        assetImage: const AssetImage("assets/icons/Air.png"),
                        parameter: "Wind speed",
                        value: (_weatherData == null)
                            ? '0°'
                            : '${_weatherData['current']['wind_speed_10m']}',
                        unit: "km/hr"),
                    const SizedBox(width: 16),
                    CustomBox(
                        assetImage: const AssetImage("assets/icons/Rain.png"),
                        parameter: "Precipitation",
                        value: (_weatherData == null)
                            ? '0°'
                            : '${_weatherData['daily']['precipitation_probability_mean'][0]}',
                        unit: "%"),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomBox(
                        assetImage:
                            const AssetImage("assets/icons/Sunrise.png"),
                        parameter: "Sunrise/Sunset",
                        value:
                            "${(_weatherData == null) ? '0°' : _weatherData['daily']['sunrise'][0].toString().split("T")[1]}/",
                        unit: (_weatherData == null)
                            ? '0°'
                            : _weatherData['daily']['sunset'][0]
                                .toString()
                                .split("T")[1]),
                    const SizedBox(width: 16),
                    CustomBox(
                        assetImage:
                            const AssetImage("assets/icons/Humidity.png"),
                        parameter: "Humidity",
                        value:
                            "${(_weatherData == null) ? '0°' : _weatherData['current']['relative_humidity_2m']}",
                        unit: "%"),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomBox(
                        assetImage:
                            const AssetImage("assets/icons/Sun light.png"),
                        parameter: "UV Index",
                        value:
                            "${(_weatherData == null) ? '0°' : _weatherData['daily']['uv_index_max'][0]}",
                        unit: ""),
                    const SizedBox(width: 16),
                    const CustomBox(
                        assetImage: AssetImage("assets/icons/Half moon.png"),
                        parameter: "Moon Phase",
                        value: "Waning\nGibbous",
                        unit: ""),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    CustomBox(
                        assetImage: AssetImage("assets/icons/Droplet.png"),
                        parameter: "Dew Point",
                        value: "27",
                        unit: "°"),
                    SizedBox(width: 16),
                    CustomBox(
                        assetImage: AssetImage("assets/icons/Eye closed.png"),
                        parameter: "Visibility",
                        value: "6.1",
                        unit: "km"),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchWeather(double lat, double lon) async {
    // final uri = Uri.parse(
    //     'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m');
    final uri = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,wind_speed_10m&hourly=&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,sunrise,sunset,uv_index_max,precipitation_probability_mean&timezone=auto&forecast_days=1');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      if (mounted) {

      setState(() {
        _weatherData = data;
      });
      }
      print(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class CustomBox extends StatelessWidget {
  final ImageProvider assetImage;
  final String parameter;
  final String value;
  final String unit;

  const CustomBox(
      {super.key,
      required this.assetImage,
      required this.parameter,
      required this.value,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: themeColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(
              assetImage,
              size: 32,
              color: Colors.black,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(parameter),
                Text(
                  "$value$unit",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
