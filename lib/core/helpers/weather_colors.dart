import 'package:flutter/material.dart';
import 'package:weather_now/weather/models/weather_types.dart';


/// This file contains helper functions to determine the background gradient based on weather conditions.
/// 
/// 

WeatherTypes resolveWeatherType(String weatherCondition) {
  final text = weatherCondition.toLowerCase();

  if (text.contains("sunny") || text.contains("clear")) {
    return WeatherTypes.sunny;
  } else if (text.contains("cloud") || text.contains("overcast")) {
    return WeatherTypes.cloudy;
  } else if (text.contains("rain") || text.contains("drizzle")) {
    return WeatherTypes.rainy;
  } else if (text.contains("snow") || text.contains("blizzard")) {
    return WeatherTypes.snowy;
  } else if (text.contains("thunder")) {
    return WeatherTypes.thunder;
  } else if (text.contains("mist") || text.contains("fog")) {
    return WeatherTypes.mist;
  } else {
    return WeatherTypes.unknown;
  }
}

LinearGradient getWeatherBackground(WeatherTypes weatherCondition, bool isDay) {

  switch (weatherCondition) {
    case WeatherTypes.sunny:
      return LinearGradient(
        colors: [Colors.orange.shade300, Colors.yellow.shade600],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case WeatherTypes.cloudy:
      return LinearGradient(
        colors: [Colors.grey.shade300, Colors.grey.shade700],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case WeatherTypes.rainy:
      return LinearGradient(
        colors: [Colors.blueGrey.shade300, Colors.blueGrey.shade900],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case WeatherTypes.snowy:
      return LinearGradient(
        colors: [
          Colors.lightBlueAccent.shade200,
          Colors.lightBlueAccent.shade400,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case WeatherTypes.thunder:
      return LinearGradient(
        colors: [
          Colors.deepPurpleAccent.shade200,
          Colors.deepPurpleAccent.shade700,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case WeatherTypes.mist:
      return LinearGradient(
        colors: [Colors.blueGrey.shade400, Colors.blueGrey.shade700],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case WeatherTypes.unknown:
      return getDefaultGradient(isDay);
  }

}

/// Fallback gradient for unknown weather conditions
/// This can be used when the weather condition doesn't match any known types
/// It provides a neutral background that can work for both day and night
/// You can customize the colors as needed to better fit your app's design
LinearGradient getDefaultGradient(bool isDay) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: isDay
        ? [Colors.blue, Colors.lightBlueAccent] // نهار
        : [Color(0xFF243B6B), Color(0xFF1B2F5C)], // ليل
  );
}
