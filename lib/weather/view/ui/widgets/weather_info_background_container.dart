import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoBackgroundContainer extends StatelessWidget {
  final Widget? containerChild;
  final bool isDay;
  final LinearGradient weatherCondition;
  
  const WeatherInfoBackgroundContainer({
    super.key,
    this.containerChild,
    required this.isDay,
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: weatherCondition,

      ),
      child: containerChild,
    );
  }
}
