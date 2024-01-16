// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:get/get.dart';
import 'package:interview/Helpers/Controllers/AuthControllers/AuthControllers.dart';

class ReusableAuthTextField extends StatelessWidget {
  String hint;
  TextInputType type;
  TextEditingController controller;
  ReusableAuthTextField({
    super.key,
    required this.hint,
    required this.type,
    required this.controller,
  });

  AuthControllers authController = AuthControllers();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          hintText: hint,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

class ReusableAuthPassword extends StatelessWidget {
  String hint;

  ReusableAuthPassword({
    super.key,
    required this.hint,
  });
  AuthControllers authController = Get.put(AuthControllers());

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          obscureText: authController.obscureText.value,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    authController.toggleObscureText();
                  },
                  icon: Icon(Icons.password)),
              hintText: hint,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ));
  }
}

class DateOfBirth extends StatelessWidget {
  String hint;
  DateOfBirth({super.key, required this.hint});

  final AuthControllers controller = Get.put(AuthControllers());
  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          controller: TextEditingController(text: controller.date.value),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(Icons.date_range)),
              hintText: hint,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ));
  }

  void _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );

    if (picked != null && picked != selectedDate) {
      controller.selectDate(picked);
    }
  }
}
