import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'colors.dart';

class ContainnersDecoration {


  static   BoxDecoration buttonDecoration  =
    themeMode ==  ThemeMode.light
      ? _buttonDecorationLight
      : _buttonDecorationDark;
  static    BoxDecoration _buttonDecorationLight = BoxDecoration(
    color: LightColors.buttonColor,
    borderRadius: BorderRadius.circular(20),
  );
  static     BoxDecoration _buttonDecorationDark = BoxDecoration(
    color:  DarkColors.buttonColor,
    borderRadius: BorderRadius.circular(20),
  );
}