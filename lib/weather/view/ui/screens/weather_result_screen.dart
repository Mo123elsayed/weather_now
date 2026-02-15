import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/weather/cubits/weather_info_cubit/weather_info_cubit.dart';
import 'package:weather_now/weather/models/weather_search_model.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_info_widget.dart';

class WeatherResultScreen extends StatefulWidget {
  const WeatherResultScreen({super.key});

  @override
  State<WeatherResultScreen> createState() => _WeatherResultScreenState();
}

class _WeatherResultScreenState extends State<WeatherResultScreen> {
  @override
  /// Builds a widget that displays the weather information of a given city.
  ///
  /// The widget fetches the weather information of the given city using the [WeatherInfoCubit].
  /// It then displays the weather information in a user-friendly format.
  ///
  /// The [WeatherInfoCubit] is provided by the [BlocProvider] above this widget in the widget tree.
  /// The [BlocProvider] is configured to create a new [WeatherInfoCubit] when this widget is created.
  ///
  /// The [WeatherInfoCubit] is given the city name to fetch the weather information as an argument.
  /// The city name is passed to the [BlocProvider] above this widget in the widget tree.
  ///
  /// The widget displays a spinner while the weather information is being fetched.
  /// If the weather information fetch fails, the widget displays an error message.
  /// If the weather information fetch succeeds, the widget displays the weather information in a user-friendly format.
  Widget build(BuildContext context) {
    final rawArgs =
        ModalRoute.of(context)?.settings.arguments as WeatherSearchModel?;

    return BlocProvider(
      create: (context) => WeatherInfoCubit()
        ..getWeather(
          rawArgs!.name!,
        ), // Pass the city name to fetch weather info
      child: Scaffold(
        body: WeatherInfoWidget(),
      ),
    );
  }
}
