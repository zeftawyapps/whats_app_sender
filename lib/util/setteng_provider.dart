import 'package:flutter/cupertino.dart';

class SettingProvider extends  ChangeNotifier{
  Setting setting = Setting();
  SettingProvider( )  ;
  void changeAppearance(int value){
   setting.  appearance = value ;
    notifyListeners();
  }
  void changeLanguage(int value){
  setting.   language = value ;
    notifyListeners();
  }
}
class Setting {
  int? appearance;
  int? language;
  Setting({this.appearance, this.language});
}
