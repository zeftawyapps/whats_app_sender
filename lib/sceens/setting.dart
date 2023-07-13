import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../const/shard_prefrance_values.dart';
import '../gen_l10n/app_localizations.dart';
import '../main.dart';
import '../util/setteng_provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> with WidgetsBindingObserver {
  int _valueAppearance = 1;
  int _valuelang = 1;

  // save the value in shared prefrences
  SharedPreferences? prefs;

  Brightness? brightness;
   SettingProvider settingProvider = SettingProvider() ;
  void initState() {
    super.initState();
    saveData();
    brightness =
        themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
     WidgetsBinding.instance.addObserver(this);
  }

  void saveData() async {
    prefs = await SharedPreferences
        .getInstance(); // get the instance of shared prefrences
    setState(() {
      _valueAppearance = prefs!.getInt(ShardPrefranceKeys.apperance) ?? 1;
      themeMode = ShardPrefranceKeys.apperances[_valueAppearance] ?? ThemeMode.system;

      _valuelang = prefs!.getInt(ShardPrefranceKeys.language) ?? 1;
      lang = ShardPrefranceKeys.languages[_valuelang] ?? 'en';
    });
  }

  @override
  Widget build(BuildContext context) {

    settingProvider = Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.setteng),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.apperance,
                      style: TextStyle(fontSize: 40.sp),
                    ),
                    // setRedioButton for light and dark

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _valueAppearance,
                            onChanged: (value) {
                              setState(() {
                                _valueAppearance = value as int;
                                setvalueChanged(_valueAppearance, _valuelang) ;
                              });

                            },
                          ),
                          Text(
                            AppLocalizations.of(context)!.light,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Radio(
                            value: 2,
                            groupValue: _valueAppearance,
                            onChanged: (value) {
                              setState(() {
                                _valueAppearance = value as int;
                                setvalueChanged(_valueAppearance, _valuelang) ;
                              });

                            },
                          ),
                          Text(
                            AppLocalizations.of(context)!.dark,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Radio(
                            value: 3,
                            groupValue: _valueAppearance,
                            onChanged: (value) {
                              setState(() {
                                _valueAppearance = value as int;
                                setvalueChanged(_valueAppearance, _valuelang) ;
                              });

                            },
                          ),
                          Text(
                            AppLocalizations.of(context)!.system,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: TextStyle(fontSize: 40.sp),
                    ),
                    // setRedioButton for language wiht Emoji
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _valuelang,
                                onChanged: (value) {
                                  setState(() {
                                    _valuelang = value as int;
                                    // save the value in shared prefrences
                                  setvalueChanged(_valueAppearance, _valuelang) ;
                                  });

                                },
                              ),
                              Text(
                                "English",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _valuelang,
                                onChanged: (value) {
                                  setState(() {
                                    _valuelang = value as int;
                                    // save the value in shared prefrences
                                  setvalueChanged(_valueAppearance, _valuelang) ;

                                  });

                                },
                              ),
                              Text(
                                "عربي",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value: 3,
                                groupValue: _valuelang,
                                onChanged: (value) {
                                  setState(() {
                                    _valuelang = value as int;
                                    // save the value in shared prefrences
                                    setvalueChanged(_valueAppearance, _valuelang) ;

                                  });

                                },
                              ),
                              Text(
                                "हिंदी",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value:4,
                                groupValue: _valuelang,
                                onChanged: (value) {
                                  setState(() {
                                    _valuelang = value as int;
                                    // save the value in shared prefrences
                                    setvalueChanged(_valueAppearance, _valuelang) ;

                                  });

                                },
                              ),
                              Text(
                                "فارسي",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setvalueChanged(int apperance , int lange ) {
    prefs!.setInt(ShardPrefranceKeys.apperance,
        apperance);
    prefs!.setInt(ShardPrefranceKeys.language,
        lange);

    settingProvider.changeAppearance(apperance);
    settingProvider.changeLanguage(lange);
  }

}
