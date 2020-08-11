import 'package:first_flutter_app/app/entities/user.dart';

abstract class AuthBase{
  Future<User> currentUser();
  Future<User> signInGuest();
  Future<User> signInWithGoogle();
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
  Future<User> nativeSignIn(String email,String password);
  Future<User> createUser(String email,String password);
}