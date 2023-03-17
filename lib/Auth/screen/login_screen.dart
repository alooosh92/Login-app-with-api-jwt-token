import 'package:flutter/material.dart';
import 'package:login/Auth/widget/login_widget.dart';

import '../widget/default_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DetAuthWidget(widget: LoginWidget()),
      ),
    );
  }
}
