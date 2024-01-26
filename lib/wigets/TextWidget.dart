import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends Text {
  double? fontSize;
  FontWeight? fontWeight;
  Color? fontColor;
  String? fontFamily;

  CustomTextWidget(super.data,
      {super.key,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.fontColor});
  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: GoogleFonts.getFont(
        fontFamily ?? "Raleway",
        textStyle: TextStyle(
          fontSize: fontSize ?? 12.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: fontColor ?? Colors.black,
        ),
      ),
    );
  }
}
