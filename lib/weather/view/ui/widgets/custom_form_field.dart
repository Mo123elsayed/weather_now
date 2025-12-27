import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const CustomFormField({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => cityValidation(value),
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      controller: controller,
      style: const TextStyle(
        fontSize: 15,
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
    );
  }

  String? cityValidation(String? text) =>
      text == null || text.isEmpty ? 'Please enter a city name' : null;
}
