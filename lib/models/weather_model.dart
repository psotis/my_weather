import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_weather/models/weather_class.dart';

WeatherJson? weatherJson;

class WeatherServise {
  fetchWeather(String city) async {
    try {
    var weatherApirl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=34604703ceb0189d472061f7508b26c9&units=metric';
    final uri = Uri.parse(weatherApirl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.body);
      weatherJson = WeatherJson.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch data');
    }
    } catch(e) {
      throw Error();
    }
    return weatherJson;
  }
  
}
