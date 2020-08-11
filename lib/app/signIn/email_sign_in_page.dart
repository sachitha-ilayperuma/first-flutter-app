import 'package:first_flutter_app/app/signIn/sign_in_form_stateful.dart';
import 'package:flutter/material.dart';

import 'email_sign_in_form_blocBased.dart';

class NativeSignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        elevation: 5.0,
      ),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card (child: EmailSignInFormStateful(),//EmailSignInFormBlocBased.create(context)
              ),
        ),
      ),
    );
  }
}

