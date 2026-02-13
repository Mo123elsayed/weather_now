import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoBackgroundContainer extends StatelessWidget {
  final Widget? containerChild;
  final bool isDay;
  const WeatherInfoBackgroundContainer({
    super.key,
    this.containerChild,
    required this.isDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDay
              ? [Colors.blue, Colors.lightBlueAccent] // نهار
              : [Color(0xFF243B6B), Color(0xFF1B2F5C)], // ليل
        ),
      ),
      child: containerChild,
    );
  }
}
