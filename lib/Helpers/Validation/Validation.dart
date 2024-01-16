import 'package:flutter/material.dart';

String? validateTextField(String value) {
  if (value.isNotEmpty) {
    return "Enter The Text";
  }
  return null;
}
