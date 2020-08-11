import 'package:first_flutter_app/app/interfaces/auth_base.dart';
import 'package:first_flutter_app/app/signIn/email_sign_in_page.dart';
import 'package:first_flutter_app/app/signIn/sign_in_bloc.dart';
import 'package:first_flutter_app/app/signIn/sign_in_button.dart';
import 'package:first_flutter_app/app/signIn/social_sign_in_button.dart';
import 'package:first_flutter_app/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final SignInBloc bloc;

  const SignInPage({Key key, @required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (context, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
          builder: (context, bloc, _) => SignInPage(bloc: bloc)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Flutter App'),
        centerTitle: true,
        elevation: 5.0,
      ),
      backgroundColor: Colors.blue[100],
      body: StreamBuilder<bool>(
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context, snapshot) {
            return _buildContent(context, snapshot.data);
          }),
    );
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50.0, child: _buildHeader(isLoading)),
          SizedBox(height: 48.0),
          SocialSignInButton(
              'images/google-logo.png',
              'Sign in with Google',
              Colors.white,
              Colors.black87,
              15.0,
              8.0,
              isLoading ? null : () => _signInWithGoogle(context),
              50.0),
          SizedBox(height: 8.0),
          SocialSignInButton(
              'images/facebook-logo.png',
              'Sign in with Facebook',
              Color(0xFF3B5998),
              Colors.white,
              15.0,
              8.0,
              () {},
              50.0),
          SizedBox(height: 8.0),
          SignInButton('Native Sign In', Colors.teal[700], Colors.white, 15.0,
              8.0, isLoading ? null : () => _nativeSignIn(context), 50.0),
          SizedBox(height: 8.0),
          Text(
            'Or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton('Guest Sign In', Colors.lime[300], Colors.black87, 15.0,
              8.0, isLoading ? null : () => _signInAsGuest(context), 50.0),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Future<void> _signInAsGuest(BuildContext context) async {
    try {
      await bloc.signInGuest();
    } on PlatformException catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  void _nativeSignIn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => NativeSignInPage(),
    ));
  }

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign In Failed',
      exception: exception,
    ).show(context);
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text('Sign In',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
        ));
  }
}
