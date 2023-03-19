import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import '../model/auth_model.dart';
import '../screen/auth_check.dart';
import '../screen/login_screen.dart';
import 'default_widget.dart';

String pass1 = "";
String pass2 = "";
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
bool hidd = false;

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
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
            validator: DefValidator.email()),
        DefTextFormField(
          onChange: (p0) {
            pass2 = p0;
          },
          icon: Icons.password,
          label: StringManager.password.tr,
          textInputType: TextInputType.visiblePassword,
          controller: password,
          radius: 20,
          hidden: !hidd,
          validator: DefValidator.confirmPassword(),
        ),
        DefTextFormField(
          onChange: (p0) {
            pass1 = p0;
          },
          icon: Icons.password,
          label: StringManager.confirmPassword.tr,
          textInputType: TextInputType.visiblePassword,
          controller: confirmPassword,
          radius: 20,
          hidden: !hidd,
          validator: DefValidator.confirmPassword(),
        ),
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
            DefText(text: StringManager.youHaveAccont.tr, size: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: DefText(
                text: StringManager.goToLoginScreen.tr,
                size: 10,
              ),
            )
          ],
        ),
      ],
      button: DefElevateButton(
        function: () async {
          try {
            if (password.text == confirmPassword.text) {
              var auth = await AuthController.register(
                User(
                  userName: email.text,
                  password: password.text,
                ),
              );
              if (auth.isAuthanticated == true) {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthCheck(),
                  ),
                );
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  DefValidator.defSnackBar(auth),
                );
              }
            }
          } catch (ex) {
            ScaffoldMessenger.of(context).showSnackBar(
              DefValidator.defSnackBar(AuthModel(message: ex.toString())),
            );
          }
        },
        text: StringManager.register.tr,
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
