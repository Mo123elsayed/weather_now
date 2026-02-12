import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoBackgroundContainer extends StatelessWidget {
  final containerChild;
  const WeatherInfoBackgroundContainer({super.key, this.containerChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      alignment: Alignment.center,
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
      child: containerChild,
    );
  }
}
