import 'package:first_flutter_app/common_widgets/custom_raised_button.dart';
import 'package:first_flutter_app/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
class SignInButton extends CustomRaisedButton{
  SignInButton(
      String text,
      Color color,
      Color textColor,
      double fontsize,
      double borderRadius,
      VoidCallback onPressed,
      double buttonHeight,
      ):super(CustomText(text,textColor,fontsize),color,borderRadius,onPressed,buttonHeight);
}