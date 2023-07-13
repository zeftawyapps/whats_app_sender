
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class Themes {
  ThemeData lightTheme = ThemeData(
     brightness: Brightness.light,
      backgroundColor: LightColors.backgroundColor,
      primaryColor: LightColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: LightColors.appBar,
        titleTextStyle: TextStyle(
          color: LightColors.appBarText,
          fontSize: 24,
        ),
        iconTheme: IconThemeData(
          color: Color(0xfff7eeee),
        ),
      ),
      drawerTheme:   DrawerThemeData(
        backgroundColor: LightColors.drawer,

      ),
      textTheme:   TextTheme(
        button: TextStyle(
          color: Colors.white,
          fontSize: 20.0.sp,
        ),
        subtitle1: TextStyle(
          color: LightColors.textFieldColor,
          fontSize: 24.sp,
        ),
        bodyText1: TextStyle(
          color: LightColors.textColor,
          fontSize: 25.sp,
        ),
        bodyText2: TextStyle(
          color: Colors.black,
          fontSize: 24.sp,
        ),
      ),
      iconTheme: IconThemeData(
        color: LightColors.iconColor,
        size: 35.sp,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: LightColors.hintColor,
          fontSize: 15.sp,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: LightColors.dividerColor, width: 1),
        ),
      ));
  ThemeData darkTheme =
  ThemeData(
      brightness: Brightness.light,
      backgroundColor: DarkColors.backgroundColor,
      primaryColor: DarkColors.primaryColor,
      appBarTheme:   AppBarTheme(
        backgroundColor: DarkColors.appBar,
        titleTextStyle: TextStyle(
          color: DarkColors.appBarText,
          fontSize: 24.sp,
        ),
        iconTheme: IconThemeData(
          color: Color(0xfff7eeee),
        ),
      ),
      drawerTheme:   DrawerThemeData(
        backgroundColor: DarkColors.drawer,
      ),
      textTheme:   TextTheme(
        button: TextStyle(
          color: Colors.white,
          fontSize: 20.0.sp,
        ),
        subtitle1: TextStyle(
          color: DarkColors.textFieldColor,
          fontSize: 24.sp,
        ),
        bodyText1: TextStyle(
          color: DarkColors.textColor,
          fontSize: 25.sp,
        ),
        bodyText2: TextStyle(
          color: Colors.white ,
          fontSize: 24.sp,
        ),
      ),
      iconTheme: IconThemeData(
        color: DarkColors.iconColor,
        size: 35.sp,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: DarkColors.hintColor,
          fontSize: 15.sp,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: DarkColors.dividerColor, width: 1),
        ),
      ));
}
