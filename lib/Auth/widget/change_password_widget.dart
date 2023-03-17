import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Auth/screen/auth_check.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import '../model/auth_model.dart';
import '../screen/login_screen.dart';
import 'default_widget.dart';

String pass3 = "";
String pass4 = "";
TextEditingController email = TextEditingController();
TextEditingController oldPassword = TextEditingController();
TextEditingController newPassword = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
bool hidd = false;

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return AuthColume(
      formkey: GlobalKey<FormState>(),
      header: [
        DefText(text: StringManager.registerScreen.tr, size: 50),
        DefText(text: StringManager.registerForFree.tr, size: 30),
      ],
      body: [
        DefTextFormField(
          onChange: null,
          icon: Icons.email,
          label: StringManager.emailAdrees.tr,
          textInputType: TextInputType.emailAddress,
          controller: email,
          radius: 20,
          hidden: false,
          validator: DefValidator.email(),
        ),
        DefTextFormField(
            onChange: null,
            icon: Icons.password,
            label: StringManager.oldPassword.tr,
            textInputType: TextInputType.visiblePassword,
            controller: oldPassword,
            radius: 20,
            hidden: !hidd,
            validator: DefValidator.password()),
        DefTextFormField(
          onChange: (p0) {
            pass3 = p0;
          },
          icon: Icons.password,
          label: StringManager.newPassword.tr,
          textInputType: TextInputType.visiblePassword,
          controller: newPassword,
          radius: 20,
          hidden: !hidd,
          validator: DefValidator.confirmPassword(),
        ),
        DefTextFormField(
          onChange: (p0) {
            pass4 = p0;
          },
          icon: Icons.password,
          label: StringManager.confirmNewPassword.tr,
          textInputType: TextInputType.visiblePassword,
          controller: confirmPassword,
          radius: 20,
          hidden: !hidd,
          validator: DefValidator.confirmPassword(),
        ),
        // DefAccontOptian(
        //     color: ColorManager.liteBlackColor,
        //     function: () {
        //       Navigator.of(context).pop();
        //     },
        //     size: 15,
        //     text: StringManager.canselTheProcess.tr),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.7,
              child: Checkbox(
                  value: hidd,
                  onChanged: (value) {
                    setState(() {
                      hidd = value!;
                    });
                  }),
            ),
            DefText(text: StringManager.hiddPassword.tr, size: 10)
          ],
        ),
      ],
      button: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefElevateButton(
            function: () async {
              if (newPassword.text == confirmPassword.text) {
                var auth = await AuthController.changePassword(
                  ChangePassword(
                    newPassword: newPassword.text,
                    oldPassword: oldPassword.text,
                    userName: email.text,
                  ),
                );
                if (auth.isAuthanticated == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthCheck(),
                    ),
                  );
                }
              }
            },
            text: StringManager.changePassword.tr,
            textSize: 15,
            color: ColorManager.primaryColor,
            highte: 40,
            width: 150,
            textColor: ColorManager.whiteColor,
          ),
          DefElevateButton(
            function: () async {
              Navigator.of(context).pop();
            },
            text: StringManager.canselTheProcess.tr,
            textSize: 15,
            color: ColorManager.redColor,
            highte: 40,
            width: 150,
            textColor: ColorManager.whiteColor,
          ),
        ],
      ),
      footer: const DefFooter(),
    );
  }
}
