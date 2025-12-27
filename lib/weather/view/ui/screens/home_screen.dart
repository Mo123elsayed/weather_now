import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/helpers/extensions.dart';
import 'package:weather_now/core/routing/routes.dart';
import 'package:weather_now/core/theme/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Weather Now',
          style: AppTextStyle.poppinsWhite20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
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
                  Image.asset(
                    'assets/imgs/weather-bg.png',
                    height: 150.h,
                    width: 150.w,
                    // fit: BoxFit.cover,
                    cacheHeight: 192,
                    cacheWidth: 192,
                  ),
                  Text(
                    "Welcome to Weather Now 🌤️",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.poppinsWhite20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Check the weather anywhere, easily.',
                    style: AppTextStyle.quicksandWhite20,
                  ),
                  SizedBox(height: 20.h),

                  /// Get Started Button
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.w),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue, Colors.purple],
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.searchScreen);
                      },
                      child: const Text(
                        "Check Weather",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 5.h,

                child: Text(
                  "Simple weather. Anytime.",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
