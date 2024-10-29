import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/errors/custom_exceptions.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '809a7ccca3e847c297e132018241504';

  Future<WeatherModel?>? getWeather(String? location) async {
    Map<String, dynamic> json;

    final url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$location&days=1');
    final response = await http.get(url);
    if (response.statusCode == 400) {
      throw InvalidLocationException(
          'No matching location found, check location name and try again');
    }
    json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }
}
