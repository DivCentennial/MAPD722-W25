import 'package:flutter/material.dart';
import 'package:weather_app/NetworkingManager.dart';
import 'package:weather_app/WeatherModel.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _weatherScreenState();
  }
}

class _weatherScreenState extends State<WeatherScreen> {
  var weatherObject = WeatherModel("", 0, "", "", 0.0);

  Future getWeatherDataFromAPI(String city) async {
    weatherObject = await NetworkingManager().getWeather(city);
    return weatherObject;
  }

  @override
  Widget build(BuildContext context) {
    var cityName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        body: FutureBuilder(
            future: getWeatherDataFromAPI(cityName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        weatherObject.cityName,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(weatherObject.mainWeather,
                          style: const TextStyle(fontSize: 30)),
                      Text(weatherObject.temp.toString(),
                          style: const TextStyle(fontSize: 30)),
                      Text('Humidity: ${weatherObject.humidity}',
                          style: const TextStyle(fontSize: 30)),
                      Image.network(
                        'https://openweathermap.org/img/wn/${weatherObject.icon}@2x.png',
                        width: 100,
                        height: 100,
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              } else {
                return const Text("Loading...");
              }
            }));
  }
}
