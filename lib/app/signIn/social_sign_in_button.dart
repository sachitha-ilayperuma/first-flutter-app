import 'package:first_flutter_app/common_widgets/custom_raised_button.dart';
import 'package:first_flutter_app/common_widgets/custom_row.dart';
import 'package:first_flutter_app/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
class SocialSignInButton extends CustomRaisedButton{
  SocialSignInButton(
      String imageURL,
      String text,
      Color color,
      Color textColor,
      double fontsize,
      double borderRadius,
      VoidCallback onPressed,
      double buttonHeight,
      ):super(CustomRow(imageURL,CustomText(text,textColor,fontsize)),color,borderRadius,onPressed,buttonHeight);
}