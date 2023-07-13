import 'package:ff_massage2hatsapp/util/setteng_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const/shard_prefrance_values.dart';
import 'const/themes.dart';
import 'gen_l10n/app_localizations.dart';
import 'main.dart';
import 'sceens/main_screen.dart';
import 'dart:ui';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  int? langvlue;

  int? apperancevlue;

  int? langvlueShard;

  int? apperancevlueShard;

  void getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      apperancevlueShard = prefs!.getInt(ShardPrefranceKeys.apperance);
      langvlueShard = prefs!.getInt(ShardPrefranceKeys.language);
      if (apperancevlueShard == null) {
        apperancevlueShard = 3;
        prefs!.setInt(ShardPrefranceKeys.apperance, 3);
      }
      if (langvlueShard == null) {
        langvlueShard =
            ShardPrefranceKeys.getLanguageKey(window.locale.languageCode);
        prefs!.setInt(ShardPrefranceKeys.language, langvlueShard!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingProvider>(
        create: (context) => SettingProvider(),
        builder: (context, child) {
          var provider = Provider.of<SettingProvider>(context);

          apperancevlue = provider.setting.appearance ?? apperancevlueShard;
          langvlue = provider.setting.language ?? langvlueShard;

          themeMode =
              ShardPrefranceKeys.apperances[apperancevlue] ?? ThemeMode.system;
          lang = ShardPrefranceKeys.languages[langvlue] ?? "en";

          return ScreenUtilInit(
              minTextAdapt: true,
              designSize: const Size(375, 812),
              builder: (context, Widget? child) {
                return MaterialApp(
                    title: 'MyApp',
                    theme: Themes().lightTheme,
                    darkTheme: Themes().darkTheme,
                    themeMode: themeMode,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: Locale(lang, ""),
                    home: MainScreen());
              });
        });
  }
}
