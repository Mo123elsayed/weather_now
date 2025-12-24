import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/helpers/extensions.dart';
import 'package:weather_now/core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Weather Now'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2196F3), // Blue color at the top
              Color(0xFF90CAF9), // Lighter blue color at the bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to WeatherNow 🌤️\nCheck the weather anywhere, easily",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 2.w,
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  /// Get Started Button
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.w),
                      gradient: const LinearGradient(
                        colors: [Colors.blueAccent, Colors.blue],
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.searchScreen);
                      },
                      child: const Text(
                        "Check Weather",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 5.h,

                child: Text(
                  "Simple weather. Anytime.",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
