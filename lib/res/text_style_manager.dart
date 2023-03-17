import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'color_manager.dart';
import 'string_manager.dart';

class NewTextStyle {
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  NewTextStyle({
    this.color,
    this.fontsize,
    this.fontWeight,
    this.fontStyle,
  });

  TextStyle textStyle() {
    return TextStyle(
        fontFamily: StringManager.font.tr,
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle);
  }
}

class TextStyleManager {
  static TextStyle defuolt = NewTextStyle().textStyle();
  static TextStyle price = NewTextStyle(
    color: Colors.white,
  ).textStyle();
  static TextStyle wellcomLogin = NewTextStyle(
    color: Colors.black,
    fontsize: 35,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle loginToContune = NewTextStyle(
    color: Colors.black,
    fontsize: 22,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle ticketRegion = NewTextStyle(
    color: Colors.white,
    fontsize: 30,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle title = NewTextStyle(
    color: ColorManager.fullBlack,
    fontsize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle appBarTitle = NewTextStyle(
    color: Colors.white,
    fontsize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle contactName = NewTextStyle(
    color: ColorManager.liteBlackColor,
    fontsize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle messageText = NewTextStyle(
    color: ColorManager.liteBlackColor,
    fontsize: 18,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  ).textStyle();
  static TextStyle hint = NewTextStyle(
    color: ColorManager.liteBlackColor,
    fontsize: 18,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  ).textStyle();
}
