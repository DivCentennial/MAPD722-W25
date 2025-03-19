import 'package:flutter/material.dart';
import 'package:weather_app/LocationManager.dart';

class MainMenuScreen extends StatelessWidget {
  void goToSearchScreen(BuildContext context) {
    Navigator.pushNamed(context, '/search');
  }

  Future<void> goToWeatherInLocation(BuildContext context) async {
    var position = await LocationManager().getCurrentLocation();
    print(position.latitude);
    print(position.longitude);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/weather',
        arguments: [2, "", position.longitude, position.latitude]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                goToSearchScreen(context);
              },
              child: const Text("Search For Cities")),
          ElevatedButton(
              onPressed: () {
                goToWeatherInLocation(context);
              },
              child: const Text("Get Weather In Location")),
        ],
      )),
    );
  }
}
