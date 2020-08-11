import 'package:first_flutter_app/app/interfaces/validate.dart';
import 'package:first_flutter_app/app/signIn/validators.dart';

class EmailAndPasswordValidators{
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email is Not Valid';
  final String invalidPasswordErrorText = "Password is Not Valid";
}