import 'package:flutter/material.dart';


class CustomRaisedButton extends StatelessWidget {

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double buttonHeight;
  CustomRaisedButton(this.child, this.color, this.borderRadius, this.onPressed,this.buttonHeight);

  @override
  Widget build(BuildContext context) {
     return SizedBox(
       height: 50.0,
       child: RaisedButton(
        child: child,
        color: color,
        disabledColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
    ),
     );
  }
}
