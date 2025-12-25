import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/helpers/extensions.dart';
import 'package:weather_now/core/routing/routes.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  const CustomFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => cityValidation(value),
        onFieldSubmitted: (value) {
          if (GlobalKey<FormState>().currentState!.validate()) {
            // Perform search action
            context.pushNamed(Routes.resultScreen);
          }
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          hintText: 'Search for a city',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  String? cityValidation(String? text) =>
      text == null || text.isEmpty ? 'Please enter a city name' : null;
}
