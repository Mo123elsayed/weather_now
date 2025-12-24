import 'package:flutter/material.dart';
import 'package:weather_now/core/helpers/extensions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Screen'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Center(
        child: Text(
          'This is the Search Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
