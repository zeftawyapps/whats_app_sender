import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/colors.dart';
import '../const/img_path.dart';
import '../gen_l10n/app_localizations.dart';
import '../sceens/setting.dart';
class MyDrower extends StatelessWidget {
  const MyDrower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:   DrawerHeader(

            decoration: BoxDecoration(
              color:  LightColors.primaryColor,
            ),
            child: Column(
              children: [
                Image(image: AssetImage(
                  ImagePath.drawer,),height:  100.h ,width: 100.w),
                Text(
                  'FF Massage' ,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                )
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Setting()));
          },
          child:   ListTile(
            leading: Icon(Icons.settings),
            title: Text( AppLocalizations.of(context)!.setting),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:   ListTile(
            leading: Icon(Icons.info),
            title: Text( AppLocalizations.of(context)!.about),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:   ListTile(
            leading: Icon(Icons.share),
            title: Text( AppLocalizations.of(context)!.share),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:   ListTile(
            leading: Icon(Icons.star),
            title: Text( AppLocalizations.of(context)!.rate),
          ),
        ),

      ]));

  }
}
