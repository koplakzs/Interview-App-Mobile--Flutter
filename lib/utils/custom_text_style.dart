import 'package:flutter/material.dart';
import 'package:interview_app/utils/colors.dart';
import 'package:interview_app/utils/fonts.dart';

class CustomTextStyle {
  static TextStyle base(
      {Color? color,
      FontWeight? fontWeight,
      double? fontSize,
      String? fontFamily}) {
    return TextStyle(
        color: color ?? Coloring.pr1100,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 14,
        fontFamily: fontFamily ?? Fonts.poppinsRegular);
  }
}
