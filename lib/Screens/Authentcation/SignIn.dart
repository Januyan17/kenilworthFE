// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Helpers/Colors/Colors.dart';
import 'package:interview/Helpers/Controllers/AuthControllers/AuthControllers.dart';
import 'package:interview/Helpers/Controllers/CommonController/CommonController.dart';
import 'package:interview/Helpers/Loader/Loader.dart';
import 'package:interview/Helpers/Variables/Variable.dart';
import 'package:interview/Screens/Authentcation/SignUp.dart';
import 'package:interview/Screens/HomeScreen/HomeScreen.dart';
import 'package:interview/Screens/Reusable/AuthReusable/Reusable.dart';
import 'package:interview/Screens/Reusable/Button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  CommonController commonController = CommonController();
  AuthControllers authController = AuthControllers();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In Here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenHeight * 0.007,
              ),
              Text(" Welcome to Kenil Worth International"),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              // Use Network Image For Image from internet
              Center(
                child: Image.asset('assets/images/dnd.png',
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.3,
                    fit: BoxFit.fitHeight),
              ),
              ReusableAuthTextField(
                controller: authController.textController,
                hint: "Enter Your Mobile Number",
                type: TextInputType.number,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              // ReusableAuthPassword(hint: "Password"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget your Password ? ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Obx(() => commonController.load.value
                    ? appLoader
                    : GestureDetector(
                        onTap: () {
                          // commonController.Loader(true.obs);
                          Get.to(HomeScreen());
                        },
                        child: CustomButton(text: "SignIn"),
                      )),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont Have an Account?"),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#90B5FF")),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
