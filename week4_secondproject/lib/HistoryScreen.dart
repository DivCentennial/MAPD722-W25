import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> history;

  const HistoryScreen({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: history.isEmpty
          ? const Center(
              child: Text('No history yet.', style: TextStyle(fontSize: 18)))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(history[index]),
                );
              },
            ),
    );
  }
}
