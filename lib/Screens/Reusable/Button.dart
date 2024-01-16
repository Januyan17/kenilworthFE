// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:interview/Helpers/Variables/Variable.dart';

class CustomButton extends StatelessWidget {
  String text;

  CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(15)),
        height: screenHeight * 0.06,
        width: screenWidth * 0.6,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )));
  }
}
