import 'package:flutter/material.dart';
import 'package:weather_now/weather/models/weather_types.dart';

/// This file contains helper functions to determine the background gradient based on weather conditions.
///
///

/// The `resolveWeatherType` function takes a weather condition string and returns a corresponding `WeatherTypes` enum value.
/// It checks for keywords in the weather condition string to determine the type of weather (e.g., sunny, cloudy, rainy, etc.).
/// If the weather condition does not match any known types, it returns `WeatherTypes.unknown`.
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

/// The `getWeatherBackground` function takes a `WeatherTypes` enum value and a boolean indicating whether it's day or night, and returns a `LinearGradient` that can be used as a background for the weather app.
/// It uses a switch statement to determine the appropriate gradient based on the weather type, providing visually distinct backgrounds for different weather conditions. If the weather type is unknown, it falls back to a default gradient that can work for both day and night.
/// You can customize the colors in the gradients to better fit your app's design and enhance the user experience.
LinearGradient getWeatherBackground(WeatherTypes weatherCondition, bool isDay) {
  switch (weatherCondition) {
    case WeatherTypes.sunny:
      return LinearGradient(
        colors: isDay
            ? [
                Colors.blue.shade400,
                Colors.lightBlueAccent.shade200,
              ] 
            : [Color(0xFF243B6B), Color(0xFF1B2F5C)], 
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
