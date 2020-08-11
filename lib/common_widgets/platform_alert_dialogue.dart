import 'package:first_flutter_app/app/interfaces/platformWidgetBase.dart';
import 'package:first_flutter_app/common_widgets/platform_alert_dialog_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String content;
  final String defaultActionText;
  final String cancelActiontext;

  Future<bool> show(BuildContext context) async{
    return await showDialog<bool>(
        context: context,
        builder: (context)=> this,
    );
  }

  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
        this.cancelActiontext,
      @required this.defaultActionText})
      : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  @override
  Widget buildCupertinoWidget(BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: _buildActions(context),
      );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
     return AlertDialog(
       title: Text(title),
       content: Text(content),
       actions:_buildActions(context),
     );
  }
  List <Widget> _buildActions(BuildContext context){
    final actions =<Widget>[];
    if(cancelActiontext!=null){
      actions.add(PlatformAlertDialogAction(
        child: Text(cancelActiontext),
        onPressed: () => Navigator.of(context).pop(false),
      ),
      );
    }
    actions.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: () => Navigator.of(context).pop(true),
      )
    );
    return actions;
  }

}

