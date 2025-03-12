import 'package:flutter/material.dart';
import 'package:weather_app/citySearchDelegate.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search For Cities'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CitySearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const Text("Search For Cities"),
    );
  }
}
