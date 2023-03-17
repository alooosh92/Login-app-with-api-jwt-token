import 'package:flutter/material.dart';
import '../widget/default_widget.dart';
import '../widget/forget_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DetAuthWidget(widget: ForgetPasswordWidget()),
      ),
    );
  }
}
