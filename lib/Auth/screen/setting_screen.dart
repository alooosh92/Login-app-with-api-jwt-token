import 'package:flutter/material.dart';

import '../widget/default_widget.dart';
import '../widget/setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DetAuthWidget(
          widget: SettingWidget(),
        ),
      ),
    );
  }
}
