import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Colors/colors.dart';

var appLoader = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    // SpinKitWave()

    SpinKitFadingCube(color: HexColor("#90D2FF"), size: 12),
    SpinKitFadingCube(color: HexColor("#90D2FF"), size: 12),
    SpinKitFadingCube(color: HexColor("#90D2FF"), size: 12),
  ],
);
