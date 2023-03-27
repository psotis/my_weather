import 'package:flutter/material.dart';
import 'package:my_weather/models/weather_class.dart';
import 'package:my_weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  // ignore: unused_field
  late WeatherJson? weather = WeatherJson();
  bool loading = false;

  getWeather(cit) async {
    print('DE DE DE DE DE DE DE $cit');
    loading = true;
    weather = await WeatherServise().fetchWeather(cit);
    loading = false;
    
    notifyListeners();
  }
}
