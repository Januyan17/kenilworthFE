import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  RxBool load = false.obs;

  void Loader(RxBool loading) {
    load.value = loading.value;
  }
}
