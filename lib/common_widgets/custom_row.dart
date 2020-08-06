import 'package:first_flutter_app/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomRow extends StatelessWidget {
  final String imageURL;
  final CustomText text;
  CustomRow(this.imageURL, this.text);



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(imageURL),
        text,
        Opacity(
            opacity: 0.0,
            child: Image.asset(imageURL))
      ],
    );
  }
}
