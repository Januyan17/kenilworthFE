import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Screens/Authentcation/SignIn.dart';

import 'package:interview/Screens/Authentcation/SignUp.dart';

void main() {
  runApp(GetMaterialApp(
    // themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false, // Remove Debug Batch
    home: SignInScreen(),
    // initialRoute: "/",
    // getPages: [
    // GetPage(name: '/', page: () => HomeScreen()),

    // GetPage(name: "/", page: () => Test1()),
    // GetPage(name: "/myapp", page: () => MyApp()),
    // ]
  ));
}
