// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Helpers/Colors/colors.dart';
import 'package:interview/Helpers/Controllers/AuthControllers/AuthControllers.dart';
import 'package:interview/Helpers/Controllers/CommonController/CommonController.dart';
import 'package:interview/Helpers/Loader/Loader.dart';
import 'package:interview/Helpers/Variables/Variable.dart';
import 'package:interview/Screens/Authentcation/Signin.dart';
import 'package:interview/Screens/Reusable/AuthReusable/Reusable.dart';
import 'package:interview/Screens/Reusable/Button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  CommonController commonController = CommonController();

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
                "Sign up Here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenHeight * 0.007,
              ),
              Text(" Welcome to Kenil Worth International"),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Center(
                child: Image.asset('assets/images/dnd.png',
                    width: 230, height: 250, fit: BoxFit.fitHeight),
                // child: Container(
                //   color: Colors.blue,
                //   height: screenHeight * 0.3,
                //   width: screenWidth * 0.6,
                // ),
              ),
              // SizedBox(
              //   height: screenHeight * 0.04,
              // ),
              ReusableAuthTextField(
                controller: firstnameController,
                hint: "Enter Your First Name",
                type: TextInputType.name,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ReusableAuthTextField(
                controller: lastnameController,
                hint: "Enter Your Last Name",
                type: TextInputType.name,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ReusableAuthTextField(
                controller: emailController,
                hint: "Enter Your Email Address",
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ReusableAuthTextField(
                controller: mobileNumController,
                hint: "Enter Your Mobile Number",
                type: TextInputType.number,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              // ReusableAuthTextField(hint: "Enter Your Name"),
              DateOfBirth(hint: "Select Your DOB"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Obx(() => commonController.load.value
                    ? appLoader
                    : GestureDetector(
                        onTap: () {
                          commonController.Loader(true.obs);
                        },
                        child: CustomButton(text: "SignUp"),
                      )),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an Account?"),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignInScreen());
                    },
                    child: Text(
                      "SignIn",
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
