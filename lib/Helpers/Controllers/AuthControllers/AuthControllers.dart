import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthControllers extends GetxController {
  RxString date = ''.obs;
  RxBool obscureText = true.obs;
  var textController = TextEditingController();
  var isTextValid = false.obs;

  void selectDate(DateTime picked) {
    date.value = picked.toString(); // You can format the date as needed
  }

  void toggleObscureText() {
    obscureText.toggle();
  }

  void validateText(String text) {
    isTextValid.value = text.isNotEmpty;
  }
}
