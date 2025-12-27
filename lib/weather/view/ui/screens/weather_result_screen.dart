import 'package:flutter/material.dart';
class WeatherResultScreen extends StatefulWidget {
  const WeatherResultScreen({super.key});

  @override
  State<WeatherResultScreen> createState() => _WeatherResultScreenState();
}

class _WeatherResultScreenState extends State<WeatherResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather Result Screen'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: const Center(
        child: Text('Weather Result Screen Content'),
      ),
    );
  }
}