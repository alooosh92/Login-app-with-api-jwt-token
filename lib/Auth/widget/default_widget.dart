import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Auth/model/auth_model.dart';
import 'package:login/Auth/widget/register_widget.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import 'auth_widget.dart';
import 'change_password_widget.dart';

BoxDecoration boxDecoration(
    Color primaryColor, Color shadowColor, double radius) {
  return BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: shadowColor,
        offset: Offset.zero,
        blurRadius: radius,
      )
    ],
  );
}

class DefValidator {
  static String? Function(String?)? email() {
    return (value) {
      if (value == null ||
          value.isEmpty ||
          !value.contains('@') ||
          !value.contains('.')) {
        return StringManager.plaseInsertEmailAdress.tr;
      }
      return null;
    };
  }

  static String? Function(String?)? password() {
    return (value) {
      if (value == null || value.isEmpty) {
        return StringManager.plaseInsertPassword.tr;
      }
      return null;
    };
  }

  static String? Function(String?)? confirmPassword() {
    return (value) {
      if (value == null || value.isEmpty) {
        return StringManager.plaseInsertPassword.tr;
      }
      if (value.length < 6) {
        return StringManager.palseInsert6LaterAtLess.tr;
      }
      if (pass1 != pass2 || pass3 != pass4) {
        return StringManager.passwordIsNotMatch.tr;
      }
      return null;
    };
  }
}

class DefElevateButton extends StatelessWidget {
  const DefElevateButton({
    super.key,
    required this.function,
    required this.text,
    required this.textSize,
    required this.color,
    required this.highte,
    required this.width,
    required this.textColor,
  });
  final String text;
  final double textSize;
  final Function() function;
  final Color color;
  final Color textColor;
  final double width;
  final double highte;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shape: const StadiumBorder(),
        backgroundColor: color,
        fixedSize: Size(width, highte),
      ),
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontFamily: StringManager.font.tr,
        ),
      ),
    );
  }
}

class DefTextFormField extends StatelessWidget {
  const DefTextFormField({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.label,
    required this.icon,
    required this.radius,
    required this.hidden,
    required this.validator,
    required this.onChange,
  });
  final TextEditingController controller;
  final TextInputType textInputType;
  final IconData icon;
  final String label;
  final double radius;
  final bool hidden;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: TextFormField(
        onChanged: onChange,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        obscureText: hidden,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: ColorManager.primaryColor,
            ),
          ),
          isDense: true,
          prefixIcon: Icon(icon),
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: StringManager.font.tr,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}

class DefAccontOptian extends StatelessWidget {
  const DefAccontOptian({
    super.key,
    required this.text,
    required this.function,
    required this.size,
    required this.color,
  });
  final String text;
  final Function() function;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontFamily: StringManager.font.tr,
            ),
          ),
        ),
      ],
    );
  }
}

class DefText extends StatelessWidget {
  const DefText(
      {super.key, required this.text, required this.size, this.color});
  final String text;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: StringManager.font.tr,
      ),
    );
  }
}

class DetAuthWidget extends StatelessWidget {
  const DetAuthWidget({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return AuthWidget(
      widget: widget,
      primaryColor: ColorManager.primaryColor,
      secandColor: ColorManager.whiteColor,
      shadowColor: ColorManager.liteBlackColor,
      margin: 10,
      padding: 20,
      radius: 20,
      height: 800,
      width: 400,
    );
  }
}

class DefFooter extends StatelessWidget {
  const DefFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefText(size: 10, text: StringManager.allRieghtReserved.tr);
  }
}

class AuthColume extends StatefulWidget {
  const AuthColume({
    super.key,
    required this.header,
    required this.body,
    required this.button,
    required this.footer,
    required this.formkey,
  });
  final List<Widget> header;
  final List<Widget> body;
  final Widget button;
  final Widget footer;
  final Key formkey;
  @override
  State<AuthColume> createState() => _AuthColumeState();
}

class _AuthColumeState extends State<AuthColume> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.header),
        Form(
          key: widget.formkey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.body,
          ),
        ),
        Center(child: widget.button),
        Center(
          child: widget.footer,
        )
      ],
    );
  }
}
