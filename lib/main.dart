import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/res/localizations_manager.dart';
import 'package:login/res/routes_manager.dart';
import 'package:login/res/theme_manager.dart';
import 'Auth/screen/auth_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AllLocalizationsManager.getLangValue();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //Routes
      routes: allRoutes,
      //Local
      translations: AllLocalizationsManager.translations,
      locale: AllLocalizationsManager.locale,
      fallbackLocale: AllLocalizationsManager.fallbackLocale,
      defaultTransition: AllLocalizationsManager.defaultTransition,
      localizationsDelegates: AllLocalizationsManager.localizationsDelegates,
      supportedLocales: AllLocalizationsManager.supportedLocales,
      //Theme
      theme: AllThemeManager.themeData,
      //Home
      home: const AuthCheck(),
    );
  }
}
