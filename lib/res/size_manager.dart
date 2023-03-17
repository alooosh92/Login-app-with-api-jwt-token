import 'package:flutter/material.dart';

class DeviesSize {
  final int fontSize;
  final double iconSize;
  final double imagesHeight;
  final double imagesWidth;
  final double height;
  final double width;
  final double loginInScreenHeight;
  final double loginInScreenWidth;
  DeviesSize({
    required this.fontSize,
    required this.iconSize,
    required this.height,
    required this.width,
    required this.imagesHeight,
    required this.imagesWidth,
    required this.loginInScreenHeight,
    required this.loginInScreenWidth,
  });
  static bool isSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediam(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  static bool isLarg(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static DeviesSize size(BuildContext context) {
    return DeviesSize.isLarg(context)
//larg
        ? DeviesSize(
            fontSize: 20,
            iconSize: 400,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            imagesHeight: MediaQuery.of(context).size.height / 2,
            imagesWidth: MediaQuery.of(context).size.width / 2,
            loginInScreenHeight: MediaQuery.of(context).size.height * 0.8,
            loginInScreenWidth: MediaQuery.of(context).size.width / 2)
//mediam
        : DeviesSize.isMediam(context)
            ? DeviesSize(
                fontSize: 15,
                iconSize: 300,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                imagesHeight: MediaQuery.of(context).size.height / 2,
                imagesWidth: MediaQuery.of(context).size.width / 1.5,
                loginInScreenHeight: MediaQuery.of(context).size.height * 0.8,
                loginInScreenWidth: MediaQuery.of(context).size.width / 2)
//small
            : DeviesSize(
                fontSize: 10,
                iconSize: 250,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                imagesHeight: MediaQuery.of(context).size.height / 2,
                imagesWidth: MediaQuery.of(context).size.width,
                loginInScreenHeight: MediaQuery.of(context).size.height,
                loginInScreenWidth: MediaQuery.of(context).size.width,
              );
  }
}
