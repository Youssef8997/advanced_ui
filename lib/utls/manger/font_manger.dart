import 'package:flutter/material.dart';

class FontsManger{
  static TextStyle? smallFont(context)=>Theme.of(context).textTheme.displaySmall;
  static TextStyle? mediumFont(context)=>Theme.of(context).textTheme.displayMedium;
  static TextStyle? largeFont(context)=>Theme.of(context).textTheme.displayLarge;
}

class  WeightManger{
  static const FontWeight bold=FontWeight.w700;
  static const FontWeight regular=FontWeight.w400;
  static const FontWeight medium=FontWeight.w500;
}