import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const Color mainColor = Color.fromARGB(255, 131, 61, 204);
const Color secondColor = Color(0xffF4F3F8);
const Color grayColor = Color.fromARGB(255, 180, 176, 176);
const Color lightGrayColor = Color(0xffF1F1F1);
const Color lightBackground = Color(0xffECECEC);
const Color blackColor = Color(0xFF111011);
const Color whiteColor = Colors.white;
ThemeData appTheme(Locale locale) {

  return ThemeData(
      canvasColor: const Color(0xffF5F5F5),
      primaryColor: mainColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: locale.languageCode == "ar" ? "Cairo" : 'Poppins',
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: mainColor,
          onPrimary: Colors.white,
          secondary: mainColor, //for selectedRadioList
          onSecondary: secondColor,
          error: Colors.red,
          onError: Colors.red,
          background: Color(0xffF5F5F5),
          onBackground: Color(0xffF5F5F5),
          surface: Colors.white,
          onSurface: mainColor), //for datePicker background
      textTheme: TextTheme(
          // ****  app bar title   ****
          headlineLarge: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.px),
          // ****   other   *****
          // big phrases as Tobsir, Our Services, Our Fortellers, Get the blue gem
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 30.px, fontWeight: FontWeight.bold),
          //subtitles
          bodyMedium: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.px),
          // mini subtitles
          displayMedium: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.px),
          //  small fonts
          bodySmall: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14.px)));
}
