import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainColor = Color.fromARGB(255, 118, 142, 252);
const Color mainColor2 = Color.fromRGBO(85, 96, 224, 1);

const Color orange2 = Color.fromRGBO(253, 91, 85, 1);
const Color orange = Color.fromRGBO(255, 134, 111, 1);

const Color greyText = Color.fromRGBO(230, 230, 244, 1);

const Color defaultIcon = Color.fromRGBO(144, 148, 178, 1);
const Color iconButton = Color.fromRGBO(228, 232, 249, 1);

const LinearGradient gradientOrange = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [orange2, orange]);

const LinearGradient gradientMain = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [mainColor2, mainColor]);

const LinearGradient gradientMainHorizontal = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mainColor2, mainColor]);

    const LinearGradient gradientGrey = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [iconButton, iconButton]);

TextStyle mainStyle(double size, Color color) {
  return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: "Montserrat");
}

TextStyle gFontStyle(double size, Color color) {
  return GoogleFonts.montserrat(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: color,
  );
}

BoxShadow shadowList() {
  return BoxShadow(
      blurRadius: 8,
      spreadRadius: 1,
      color: Colors.black.withOpacity(0.2),
      offset: const Offset(0, 4));
}
