import 'package:flutter/material.dart';

class ShardPrefranceKeys{
  static const String apperance = "apperance";
  static const String language = "language";
  static Map<int   , String> languages = {
    1 : "en",
    2 : "ar",
    3 : "hi",
    4 : "fa",
  };

  static int  getLanguageKey(String ? lang){
    int key = 0;
    languages.forEach((k, v) {
      if(v == lang){
        key = k;
      }
    });
    if (key == 0){
      key = 1;
    }
    return key;

  }
  static Map<int   , ThemeMode > apperances = {
    1 : ThemeMode.light,
    2 : ThemeMode.dark,
    3 : ThemeMode.system,
  };

  static Map<String , String > countryPhone =
  {
    "US": "+1",
    "UK": "+44",
    "AE": "+971",
    "QA": "+974",
    "KW": "+965",
    "IN": "+91",
    "JP": "+81",
    "SA": "+966",
    "EG": "+20",
    "CA": "+1",
    "CN": "+86",
    "FR": "+33",
    "DE": "+49",
    "IT": "+39",
    "MX": "+52",
    "RU": "+7",
    "KR": "+82",
    "ES": "+34"
  } ;

}