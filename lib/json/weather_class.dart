import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Weather {
  String? country;
  double? temp;
  double? humidity;
  Weather({
    this.country,
    this.temp,
    this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      country: json['country'],
      temp: json['temp'],
      humidity: json['humidity'],
    );
  }
}

Future<Weather> fetchWeather() async {
  final response = await http.get(
    Uri.parse(
        'http://api.weatherstack.com/current?access_key=152cea0f34fe392c8f0696dfda9169be&query=37.8267,-122.4233'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Failed to fetch data');
  }
}
