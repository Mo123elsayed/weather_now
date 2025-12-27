import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/core/routing/routes.dart';
import 'package:weather_now/weather/cubits/weather_search/weather_search_cubit.dart';
import 'package:weather_now/weather/view/ui/screens/home_screen.dart';
import 'package:weather_now/weather/view/ui/screens/search_screen.dart';
import 'package:weather_now/weather/view/ui/screens/weather_result_screen.dart';

class AppRoutes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.searchScreen:
        // Return the route for the search screen
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => WeatherSearchCubit(),
            child: SearchScreen(),
          ),
        );
      case Routes.resultScreen:
        // Return the route for the result screen
        return MaterialPageRoute(builder: (_) => WeatherResultScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
