import 'package:flutter/material.dart';
import 'package:login/Auth/screen/login_screen.dart';
import 'package:login/Auth/screen/setting_screen.dart';
import 'package:login/Auth/screen/witting_screen.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/screen/home_screen.dart';
import '../model/auth_model.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthController.checkToken(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const WittingScreen(
            color: ColorManager.primaryColor,
          );
        } else {
          if (snapshot.data!) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
