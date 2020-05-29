import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class HttpService {
  static String baseUrl =
      'https://rest.coinapi.io/v1/exchangerate';
  static String apiKey = 'DA591253-68C3-4F38-BA43-0FC0D867B6C5';

  static Future<Weather> getWeather(double lat,  double lon) async {
    String url = baseUrl + 'units=metric&lat=$lat&lon=$lon&appid=$apiKey';
    Response response = await get(url);

    return parseWeather(response);
  }

  static Future<Weather> getWeatherByCity(String cityName) async {
    String url = baseUrl + 'units=metric&q=$cityName&appid=$apiKey';
    Response response = await get(url);

    return parseWeather(response);
  }

  static Weather parseWeather(Response response) {
    var json = jsonDecode(response.body);
    int temperature = json['main']['temp'].toInt();
    int condition = json['weather'][0]['id'];
    String city = json['name'];

    return Weather(temperature: temperature, city: city, condition: condition);
  }
}

class Weather {
  int temperature;
  String city;
  int condition;

  Weather({this.temperature, this.city, this.condition});

  @override
  String toString() {
    return 'Weather{temperature: $temperature, city: $city, condition: $condition}';
  }
}
