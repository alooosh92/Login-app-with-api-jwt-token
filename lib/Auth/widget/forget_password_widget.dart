import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Auth/screen/login_screen.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import '../model/auth_model.dart';
import 'default_widget.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return AuthColume(
      formkey: GlobalKey<FormState>(),
      header: [
        DefText(text: StringManager.forgetPassword.tr, size: 30),
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
        DefAccontOptian(
            color: ColorManager.liteBlackColor,
            function: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            size: 15,
            text: StringManager.loginScreen.tr),
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
            var auth = await AuthController.forgetPassword(email.text);
            if (auth == true) {
              Navigator.of(context).pop();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            }
          } catch (ex) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              DefValidator.defSnackBar(AuthModel(message: ex.toString())),
            );
          }
        },
        text: StringManager.restPassword.tr,
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
