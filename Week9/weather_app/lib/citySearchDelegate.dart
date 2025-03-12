import 'package:flutter/material.dart';
import 'package:weather_app/NetworkingManager.dart';

class CitySearchDelegate extends SearchDelegate {
  var citiesList = [];

  Future getAllCitiesFromAPI(String searchTerm) async {
    var list = await NetworkingManager().getAllCities(searchTerm);
    citiesList = list;
    return list;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
            citiesList = [];
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: getAllCitiesFromAPI(query),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: citiesList.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(citiesList[index]),
                  onTap: () {},
                ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: getAllCitiesFromAPI(query),
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: citiesList.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(citiesList[index]),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/weather',
                        arguments: citiesList[index] as String);
                  },
                ));
      },
    );
  }
}
