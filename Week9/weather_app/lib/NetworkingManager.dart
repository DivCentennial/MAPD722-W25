import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/WeatherModel.dart';

class NetworkingManager {
  Future<List<String>> getAllCities(String city) async {
    http.Response response = await http
        .get(Uri.parse('http://gd.geobytes.com/AutoCompleteCity?&q=$city'));
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      List<String> list = [];
      return list;
    }
  }

  Future<WeatherModel> getWeather(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=071c3ffca10be01d334505630d2c1a9c&units=metric'));
    if (response.statusCode == 200) {
      var jsonObj = jsonDecode(response.body);
      var temp = jsonObj['main']['temp'] as double;
      var des = jsonObj['weather'][0]['description'];
      var icon = jsonObj['weather'][0]['icon'];
      var humi = jsonObj['main']['humidity'] as int;
      return WeatherModel(cityName, humi, icon, des, temp);
    } else {
      return WeatherModel(cityName, 0, "", "No Result", 0.0);
    }
  }

  Future<WeatherModel> getWeatherDataBasedOnLocation(
      double lon, double lat) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=071c3ffca10be01d334505630d2c1a9c&units=metric'));
    if (response.statusCode == 200) {
      var jsonObj = jsonDecode(response.body);
      var temp = jsonObj['main']['temp'] as double;
      var des = jsonObj['weather'][0]['description'];
      var icon = jsonObj['weather'][0]['icon'];
      var humi = jsonObj['main']['humidity'] as int;
      return WeatherModel("Log $lon - Lat - $lat", humi, icon, des, temp);
    } else {
      return WeatherModel("", 0, "", "No Result", 0.0);
    }
  }
}
