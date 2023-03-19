import 'package:flutter/material.dart';

import 'default_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.primaryColor,
    required this.secandColor,
    required this.radius,
    required this.shadowColor,
    required this.margin,
    required this.height,
    required this.width,
    required this.widget,
    required this.padding,
  });
  final Color primaryColor;
  final Color secandColor;
  final Color shadowColor;
  final double radius;
  final double margin;
  final double padding;
  final double height;
  final double width;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: boxDecoration(primaryColor, shadowColor, 0),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(margin),
          padding: EdgeInsets.all(padding),
          decoration: boxDecoration(secandColor, shadowColor, radius),
          height: height,
          width: width,
          child: SafeArea(child: widget),
        ),
      ),
    );
  }
}
