import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/weather/cubits/weather_info_cubit/weather_info_cubit.dart';
import 'package:weather_now/weather/models/weather_search_model.dart';
import 'package:weather_now/weather/view/ui/widgets/background_container.dart';

class WeatherResultScreen extends StatefulWidget {
  const WeatherResultScreen({super.key});

  @override
  State<WeatherResultScreen> createState() => _WeatherResultScreenState();
}

class _WeatherResultScreenState extends State<WeatherResultScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final rawArgs =
        ModalRoute.of(context)?.settings.arguments as WeatherSearchModel;

    final route = ModalRoute.of(context);
    log("ROUTE = $route");
    log("ARGS = $rawArgs");
    log("ARGS LAT = ${rawArgs.lat}");
    log("ARGS LON = ${rawArgs.lon}");
    log("ARGS NAME = ${rawArgs.name}");

    return BlocProvider(
      create: (context) => WeatherInfoCubit()
        ..getWeather(rawArgs.name), // Pass the city name to fetch weather info
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Weather Result Screen'),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: BackgroundContainer(
          containerChild: BlocConsumer<WeatherInfoCubit, WeatherInfoState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is WeatherInfoLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              if (state is WeatherInfoFailure) {
                log(state.message);
                return Center(child: Text(state.message));
              }
              if (state is WeatherInfoSuccess) {
                // final selectedCity = state.weatherResult.firstWhere((city) {
                //   return city.location.name == rawArgs.name &&
                //       city.location.lat == rawArgs.lat &&
                //       city.location.lon == rawArgs.lon;
                // });

                log("SELECTED CITY = ${state.weatherResult.location.name}");

                return Column(
                  children: [
                    Text(
                      'Weather in ${state.weatherResult.location.name}: ${state.weatherResult.current.tempC}°C',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
