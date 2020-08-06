import 'package:first_flutter_app/app/signIn/sign_in_button.dart';
import 'package:first_flutter_app/app/signIn/social_sign_in_button.dart';
import 'package:first_flutter_app/common_widgets/custom_raised_button.dart';
import 'package:first_flutter_app/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Flutter App'),
        centerTitle: true,
        elevation: 5.0,
      ),
      backgroundColor: Colors.blue[100],
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton('images/google-logo.png','Sign in with Google', Colors.white, Colors.black87,
              15.0, 8.0, () {}, 50.0),
          SizedBox(height: 8.0),
          SocialSignInButton('images/facebook-logo.png','Sign in with Facebook', Color(0xFF3B5998), Colors.white,
              15.0, 8.0, () {}, 50.0),
          SizedBox(height: 8.0),
          SignInButton('Native Sign In', Colors.teal[700], Colors.white, 15.0,
              8.0, () {}, 50.0),
          SizedBox(height: 8.0),
          Text(
            'Or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton('Guest Sign In', Colors.lime[300], Colors.black87, 15.0,
              8.0, () {}, 50.0),
          SizedBox(height: 8.0,),


    ],

      ),
    );
  }
}
