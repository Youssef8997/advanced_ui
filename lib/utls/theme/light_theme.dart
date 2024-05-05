import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manger/color_manger.dart';
import '../manger/font_manger.dart';

const String fontFamily = "Tajawal";

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        toolbarHeight: 30,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStatePropertyAll(ColorsManger.pColor),
              textStyle: const MaterialStatePropertyAll(TextStyle(
                  color: ColorsManger.white,
                  fontWeight: WeightManger.bold,
                  fontSize: 18,
                  fontFamily: fontFamily)),
              foregroundColor:
                  const MaterialStatePropertyAll(ColorsManger.white),
              fixedSize: const MaterialStatePropertyAll(
                Size(300, 45),
              ),
              elevation: const MaterialStatePropertyAll(0),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              enableFeedback: true,
              // backgroundColor: const MaterialStatePropertyAll(ColorsManger.primaryColors),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero))),
      primaryColor: ColorsManger.pColor,
      textTheme: TextTheme(
          displaySmall: TextStyle(
              color: ColorsManger.pColor,
              fontWeight: WeightManger.regular,
              fontSize: 16,
              fontFamily: fontFamily),
          displayLarge: TextStyle(
              color: ColorsManger.pColor,
              fontSize: 20,
              fontWeight: WeightManger.bold,
              fontFamily: fontFamily,
              locale: Locale("ar"),
              textBaseline: TextBaseline.alphabetic),
          displayMedium: TextStyle(
              color: ColorsManger.pColor,
              fontSize: 14,
              fontFamily: fontFamily,
              fontWeight: WeightManger.medium),
          labelSmall: TextStyle(
            color: ColorsManger.white,
            fontSize: 14,
            fontFamily: fontFamily,
            fontWeight: WeightManger.medium,
          )),
    );
