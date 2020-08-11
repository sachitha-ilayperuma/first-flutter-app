abstract class StringValidator{
  bool isValid(String value);
  bool isValidEmail(String value);
  bool isValidPassword(String password, [int minLength = 6]);
}