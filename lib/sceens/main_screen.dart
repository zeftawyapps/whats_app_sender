import 'dart:io';
import 'dart:ui';
import 'package:ff_massage2hatsapp/const/shard_prefrance_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/container_styel.dart';
import '../const/img_path.dart';
import '../util/ads_helper.dart';
import '../util/setteng_provider.dart';
 import '../widget/drawer.dart';
import '../gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

// add controller to text field for country cod
  TextEditingController countryCodeController = TextEditingController();
  String countryPhoneCode = '';
  String phoneNumber = '';
  String massage = '';
  BannerAd? _bannerAd;
  String countryCode = Platform.localeName.split('_')[1];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    String phoncode =
        ShardPrefranceKeys.countryPhone[Platform.localeName.split('_')[1]] ??
            "+966";

    countryCodeController.text = '$phoncode';

    return  Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: const Text('FF Messege'),
          ),
          drawer: MyDrower(),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 400.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImagePath.wall),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          controller: countryCodeController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .countryEmptyError;
                                            }
                                          },
                                          onSaved: (value) {
                                            countryPhoneCode = value!;
                                          },
                                          decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .countryCode,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return AppLocalizations.of(
                                                        context)
                                                    .phoneEmptyError;
                                              } else if (value.length < 10) {
                                                return AppLocalizations.of(
                                                        context)
                                                    .phoneLingthError;
                                              }
                                            },
                                            onSaved: (value) {
                                              phoneNumber = value!;
                                            },
                                            decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)
                                                      .PhoneNumber,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 2,
                                  validator: (value) {},
                                  onSaved: (value) {
                                    massage = value ?? "  ";
                                  },
                                  decoration: InputDecoration(
                                    labelText:
                                        AppLocalizations.of(context).massage,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                MaterialButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        print(
                                            'country code is $countryPhoneCode');
                                        print('phone number is $phoneNumber');
                                        print('massage is $massage');

                                        // send to whatsapp

                                        launch(
                                            'https://wa.me/$countryPhoneCode$phoneNumber?text=$massage');
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      height: 60.h,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      decoration: ContainnersDecoration
                                          .buttonDecoration,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).send,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button,
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            IconTheme(
                                                data:
                                                    Theme.of(context).iconTheme,
                                                child: Icon(
                                                  Icons.send,
                                                )),
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 150.h,
                                ),
                                Container(
                                  height: 50.h,
                                  color: Colors.grey,
                                  child: _bannerAd != null
                                      ? AdWidget(ad: _bannerAd!)
                                      : SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );


  }
}
