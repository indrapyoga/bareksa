import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color yellow = Color.fromARGB(255, 251, 244, 109);
Color green = Color.fromARGB(255, 226, 235, 221);
Color blue = Color.fromARGB(255, 84, 151, 141);
Color purple = Color.fromARGB(255, 135, 114, 176);
Color darkPurple = Color.fromARGB(255, 51, 38, 77);
Color lightGreen = Color.fromARGB(255, 130, 195, 65);
Color pastelGreen = Color.fromARGB(255, 164, 190, 123);

Color darkGreen = Color.fromARGB(255, 57, 81, 68);

class CustomText extends StatelessWidget {
  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  Color? color;
  TextAlign? textAlignment;
  TextOverflow? overflow;

  CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        overflow: overflow,
        textAlign: textAlignment,
        style: GoogleFonts.lato(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            color: color));
  }
}
