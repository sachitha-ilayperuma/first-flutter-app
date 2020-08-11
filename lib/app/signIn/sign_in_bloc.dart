import 'dart:async';

import 'package:first_flutter_app/app/entities/user.dart';
import 'package:first_flutter_app/app/interfaces/auth_base.dart';
import 'package:flutter/foundation.dart';

class SignInBloc {
  SignInBloc({@required this.auth});

  final AuthBase auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;

    }
  }

  Future<User> signInGuest() async => await _signIn(auth.signInGuest);

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);
}
