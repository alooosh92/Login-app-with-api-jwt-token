import 'package:flutter/material.dart';
import 'package:login/Auth/widget/register_widget.dart';
import '../widget/default_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DetAuthWidget(widget: RegisterWidget()),
      ),
    );
  }
}
