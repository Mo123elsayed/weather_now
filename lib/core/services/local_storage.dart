import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _cityKey = 'city';
  static final prefs = SharedPreferences.getInstance();

  /// Saves the city name to local storage.
  /// [city] The name of the city to save.
  /// Returns a Future that completes when the city name has been saved.
  static Future<void> saveCity(String city) async {
    final instance = await prefs;
    await instance.setString(_cityKey, city);
  }

  /// Retrieves the city name from local storage.
  /// Returns a Future that completes with the city name, or null if it is not set.
  static Future<String?> getCity() async {
    final instance = await prefs;
    return instance.getString(_cityKey);
  }
}
