import 'package:flutter/material.dart';
import 'package:weather_app/NetworkingManager.dart';
import 'package:weather_app/WeatherModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Future getWeatheInLocation(double lon, double lat) async {
    weatherObject =
        await NetworkingManager().getWeatherDataBasedOnLocation(lon, lat);
    print("after getting the weather");
    print(weatherObject.icon);
    print(weatherObject.temp);

    return weatherObject;
  }

  @override
  Widget build(BuildContext context) {
    var listOfArguments = ModalRoute.of(context)!.settings.arguments as List;
    var source = listOfArguments[0] as int;
    var cityName = listOfArguments[1] as String;
    var lon = listOfArguments[2] as double;
    var lat = listOfArguments[3] as double;
    GoogleMapController? _mapController;
    LatLng? _currentLocation;
    _currentLocation = LatLng(lat, lon);

    //_currentLocation =
    return Scaffold(
        body: FutureBuilder(
            future: (source == 1)
                ? getWeatherDataFromAPI(cityName)
                : getWeatheInLocation(lon, lat),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Column(
                    children: [
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
                      (source == 2)
                          ? Expanded(
                              child: _currentLocation == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                        target: _currentLocation!,
                                        zoom: 15,
                                      ),
                                      onMapCreated: (controller) {
                                        _mapController = controller;
                                      },
                                      markers: {
                                        Marker(
                                          markerId:
                                              const MarkerId("currentLocation"),
                                          position: _currentLocation!,
                                          infoWindow: const InfoWindow(
                                              title: "You are here"),
                                        ),
                                      },
                                    ))
                          : const Text("")
                    ],
                  ),
                );
              } else {
                return const Text("Loading...");
              }
            }));
  }
}
