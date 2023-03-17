import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';

class WittingScreen extends StatelessWidget {
  const WittingScreen({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Text(
          StringManager.witting.tr,
          style: TextStyle(
              fontSize: 30,
              fontFamily: StringManager.font.tr,
              color: ColorManager.whiteColor),
        ),
      ),
    );
  }
}
