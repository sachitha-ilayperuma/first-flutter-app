

import 'package:first_flutter_app/app/interfaces/platformWidgetBase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialogAction extends PlatformWidget{
  final Widget child;
  final VoidCallback onPressed;

  PlatformAlertDialogAction({this.child, this.onPressed});


  @override
  Widget buildCupertinoWidget(BuildContext context) {
      return CupertinoDialogAction(
        child: child,
        onPressed: onPressed,
      );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }

}