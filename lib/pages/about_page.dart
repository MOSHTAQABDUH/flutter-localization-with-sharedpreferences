import 'package:flutter/material.dart';
import 'package:testlang/localization/app_localizations.dart';
import 'package:testlang/localization/language_constants.dart';
import 'package:testlang/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}
//String languageCode = (prefs.getString(LAGUAGE_CODE) ?? 'en');
class _AboutPageState extends State<AboutPage> {
  _fetchLocale() async {
    Locale tempLocale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = (prefs.getString(LAGUAGE_CODE) ?? 'en');

    switch (languageCode) {
      case ENGLISH:
        tempLocale = Locale(ENGLISH, 'US');
        break;
      case ar:
        tempLocale = Locale(ar, '');
        break;
      default:
        tempLocale = Locale(ENGLISH, 'US');
    }
    return tempLocale;
  }
  void _changeLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode1 = (prefs.getString(LAGUAGE_CODE) ?? 'en');
    Locale locale;
    if (languageCode1 ==  "ar" ) {
      locale = Locale('en', 'US');
      await prefs.setString(LAGUAGE_CODE, 'en');
    } else {
      locale = Locale('ar', '');
      await prefs.setString(LAGUAGE_CODE, 'ar');
    }
    FlutterLocalization.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(buildTranslate(context, 'about_page')),
          actions: <Widget>[
            MaterialButton(
              height: 50,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                _changeLanguage();
              },
              child: Text(
                buildTranslate(context, 'english'),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(buildTranslate(context, 'about_app')),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  _changeLanguage();
                },
                child: Text(
                  buildTranslate(context, 'english'),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  _changeLanguage();
                },
                child: Text(
                  buildTranslate(context, 'ar'),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
