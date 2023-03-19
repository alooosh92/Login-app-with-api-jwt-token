import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Auth/model/auth_model.dart';
import 'package:login/Auth/screen/auth_check.dart';
import 'package:login/Auth/screen/forget_password_screen.dart';
import 'package:login/Auth/screen/register_screen.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import 'default_widget.dart';

bool hidd = false;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return AuthColume(
      formkey: GlobalKey<FormState>(),
      header: [
        DefText(text: StringManager.loginScreen.tr, size: 50),
        DefText(text: StringManager.loginToContunie.tr, size: 30),
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
          onChange: (p0) => hidd = !hidd,
          icon: Icons.password,
          label: StringManager.password.tr,
          textInputType: TextInputType.visiblePassword,
          controller: password,
          radius: 20,
          hidden: !hidd,
          validator: DefValidator.password(),
        ),
        DefAccontOptian(
            color: ColorManager.liteBlackColor,
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordScreen(),
                ),
              );
            },
            size: 15,
            text: StringManager.forgetPassword.tr),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefText(text: StringManager.youDoNotHaveAnAccont.tr, size: 10),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: DefText(
                  text: StringManager.registerForFree.tr,
                  size: 10,
                ))
          ],
        ),
      ],
      button: DefElevateButton(
        function: () async {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            },
          );
          try {
            var auth = await AuthController.login(
              User(
                userName: email.text,
                password: password.text,
              ),
            );
            if (auth.isAuthanticated == true) {
              Navigator.of(context).pop();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthCheck(),
                ),
              );
            } else {
              Navigator.of(context).pop();
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                DefValidator.defSnackBar(auth),
              );
            }
          } catch (ex) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              DefValidator.defSnackBar(AuthModel(message: ex.toString())),
            );
          }
        },
        text: StringManager.login.tr,
        textSize: 15,
        color: ColorManager.primaryColor,
        highte: 40,
        width: 300,
        textColor: ColorManager.whiteColor,
      ),
      footer: const DefFooter(),
    );
  }
}
