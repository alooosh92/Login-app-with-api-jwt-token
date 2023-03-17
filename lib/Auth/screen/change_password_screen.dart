import 'package:flutter/material.dart';
import '../widget/change_password_widget.dart';
import '../widget/default_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DetAuthWidget(widget: ChangePasswordWidget()),
      ),
    );
  }
}
