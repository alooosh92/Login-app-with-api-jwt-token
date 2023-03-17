import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/localizations_manager.dart';
import '../model/auth_model.dart';
import '../screen/auth_check.dart';
import '../screen/change_password_screen.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          TextOption(
            text: StringManager.changeLang.tr,
            icon: Icons.language,
            fun: () async {
              var shared = await SharedPreferences.getInstance();
              if (shared.getString('lang') == 'ar') {
                AllLocalizationsManager.setLangValue('en');
                Get.updateLocale(const Locale('en'));
              } else {
                AllLocalizationsManager.setLangValue('ar');
                Get.updateLocale(const Locale('ar'));
              }
            },
          ),
          const DefDivider(),
          TextOption(
            text: StringManager.changePassword.tr,
            icon: Icons.password,
            fun: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                ),
              );
            },
          ),
          const DefDivider(),
          TextOption(
            text: StringManager.logout.tr,
            icon: Icons.logout,
            fun: () async {
              var auth = await AuthController.revokeToken();
              if (auth == true) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthCheck(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class DefDivider extends StatelessWidget {
  const DefDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Divider(
        color: ColorManager.primaryColor,
        height: 10,
        thickness: 1,
      ),
    );
  }
}

class TextOption extends StatelessWidget {
  const TextOption({
    super.key,
    required this.text,
    required this.icon,
    required this.fun,
  });
  final String text;
  final IconData icon;
  final Function() fun;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: fun,
          icon: Icon(
            icon,
            size: 25,
            color: ColorManager.primaryColor,
          ),
          label: Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontFamily: StringManager.font.tr,
                color: ColorManager.primaryColor),
          ),
        ),
      ],
    );
  }
}
