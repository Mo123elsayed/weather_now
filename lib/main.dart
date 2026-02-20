import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/weather/cubits/weather_info_cubit/weather_info_cubit.dart';
import 'package:weather_now/weather_now_app.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherInfoCubit(),
      child: WeatherNowApp(),
    ),
  );
}
