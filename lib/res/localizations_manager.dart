import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'translation_manager.dart';

class AllLocalizationsManager {
  static void getLangValue() async {
    var shared = await SharedPreferences.getInstance();
    var l = shared.getString('lang');
    if (l == null || l.isEmpty) {
      locale = const Locale('ar');
      fallbackLocale = const Locale('en');
      shared.setString('lang', 'ar');
    } else {
      if (l == 'ar') {
        locale = const Locale('ar');
        fallbackLocale = const Locale('en');
        shared.setString('lang', 'ar');
      } else {
        locale = const Locale('en');
        fallbackLocale = const Locale('ar');
        shared.setString('lang', 'en');
      }
    }
  }

  static void setLangValue(String lang) async {
    var shared = await SharedPreferences.getInstance();
    shared.setString('lang', lang);
  }

  static Translations translations = TranslationManager();
  static Locale locale = const Locale('ar');
  static Locale fallbackLocale = const Locale('en');
  static const Transition defaultTransition = Transition.fade;
  static const Iterable<Locale> supportedLocales = [Locale('ar'), Locale('en')];
  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
