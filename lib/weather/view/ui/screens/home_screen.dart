import 'package:flutter/material.dart';

import 'package:weather_now/core/routing/routes.dart';
import 'package:weather_now/core/services/local_storage.dart';

import 'package:weather_now/weather/models/weather_search_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkSavedCity();
  }

  /// Check if there's a saved city in local storage and navigate to the weather result screen if found
  /// This allows users to quickly access their last checked city's weather without having to search for it again.
  /// If a saved city is found, the user is automatically taken to the weather result screen, providing a seamless experience.
  /// This function is called during the initialization of the home screen to ensure that the check is performed as soon as the app starts.
  /// The function uses the `LocalStorage` service to retrieve the saved city and the `Navigator` to navigate to the weather result screen if a saved city is found.
  /// Note: This function assumes that the weather result screen is set up to handle the case where a saved city is provided, and that it can display the weather information for that city accordingly.
  void _checkSavedCity() async {
    final savedCity = await LocalStorage.getCity();
    if (savedCity != null) {
      Navigator.pushReplacementNamed(
        context,
        Routes.weatherResultScreen,
        arguments: WeatherSearchModel(name: savedCity),
      );
    }
  }

  @override
  ///
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
