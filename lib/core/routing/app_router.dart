import 'package:flutter/material.dart';
import 'package:weather_now/core/routing/routes.dart';
import 'package:weather_now/features/view/ui/screens/home_screen.dart';
import 'package:weather_now/features/view/ui/screens/search_screen.dart';

class AppRoutes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.searchScreen:
        // Return the route for the search screen
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case Routes.resultScreen:
        // Return the route for the result screen
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Result Screen'))),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
