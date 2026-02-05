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
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as WeatherSearchModel?;

    // final selectedCity = weatherResults.firstWhere(
    //   (weather) => weather.lat == cityLat && weather.lon == cityLon,
    //   orElse: () => WeatherModel(
    //     cityName: 'Unknown',
    //     country: 'Unknown',
    //     lat: 0.0,
    //     lon: 0.0,
    //     temp: 0.0,
    //     feelsLike: 0.0,
    //     tempMin: 0.0,
    //     tempMax: 0.0,
    //     pressure: 0,
    //     humidity: 0,
    //     visibility: 0,
    //     weatherMain: 'Unknown',
    //     weatherDescription: 'Unknown',
    //     weatherIcon: '01d',
    //     windSpeed: 0.0,
    //     windDeg: 0,
    //     cloudiness: 0,
    //     sunrise: 0,
    //     sunset: 0,
    //   ),
    // );

    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Weather Result Screen'),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: const Center(child: Text('No such city, please try again.')),
      );
    } else {
      return BlocProvider(
        create: (context) => WeatherInfoCubit()..getWeather(args.name),
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
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is WeatherInfoSuccess) {
                  final selectedCity = state.weatherResult;
                  return Column(
                    children: [
                      Text(
                        'Weather in ${selectedCity.cityName}, ${selectedCity.country}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    }
  }
}
