import 'package:first_flutter_app/common_widgets/platform_alert_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog{
  PlatformExceptionAlertDialog(
  { @required String title, @required PlatformException exception,
  }) : super(
    title: title,
    content:_message(exception),
    defaultActionText: 'OK'

  );
  static String _message(PlatformException exception){

    return _errors[exception.code]??exception.message;
  }
  static Map<String,String> _errors = {
    ///  * `ERROR_WEAK_PASSWORD` - If the password is not strong enough.
    ///  * `ERROR_INVALID_EMAIL` - If the email address is malformed.
    'ERROR_EMAIL_ALREADY_IN_USE':'Entered Email is Already Used',
    'ERROR_INVALID_EMAIL' : 'The Email is Invalid',
    'ERROR_WRONG_PASSWORD' :'The Password is Invalid',
    'ERROR_USER_NOT_FOUND': 'No User Account associated with the given Email',
    ///  * `ERROR_USER_DISABLED` - If the user has been disabled (for example, in the Firebase console)
    ///  * `ERROR_TOO_MANY_REQUESTS` - If there was too many attempts to sign in as this user.
    ///  * `ERROR_OPERATION_NOT_ALLOWED` - Indicates that Email & Password accounts are not enabled.
  };
}