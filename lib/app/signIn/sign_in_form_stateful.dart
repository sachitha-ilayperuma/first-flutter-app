import 'package:first_flutter_app/app/interfaces/auth_base.dart';
import 'package:first_flutter_app/app/services/emailPasswordValidate.dart';
import 'package:first_flutter_app/common_widgets/form_submit_button.dart';
import 'package:first_flutter_app/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'email_sign_in_model.dart';





class EmailSignInFormStateful extends StatefulWidget with EmailAndPasswordValidators {

  @override
  _EmailSignInFormStatefulState createState() => _EmailSignInFormStatefulState();
}

class _EmailSignInFormStatefulState extends State<EmailSignInFormStateful> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  bool _isloading =false;

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }


  Future<void> _submit() async{
    setState(() {
      _submitted=true;
      _isloading=true;
    });
    try {
      final auth =  Provider.of<AuthBase>(context, listen: false);
      if (_formType == EmailSignInFormType.signIn) {
        await auth.nativeSignIn(_email, _password);
      } else {
        await auth.createUser(_email, _password);
      }
      Navigator.of(context).pop();
    }on PlatformException catch(e){
      PlatformExceptionAlertDialog(
         title: 'Sign In Failed',
         exception: e,

       ).show(context);
    }finally{
      setState(() {
        _updateState();
        _isloading=false;
        _emailController.clear();
        _passwordController.clear();
      });
    }
  }
  void _emailEditingComplete(){
      final newFocus = widget.emailValidator.isValidEmail(_email)?_passwordFocusNode:_emailFocusNode;
      FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType(){
    setState(() {
      _submitted=false;
     _formType = _formType == EmailSignInFormType.signIn?
        EmailSignInFormType.register: EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren(){
    final primaryText = _formType == EmailSignInFormType.signIn?'Sign In':'Create An Account';
    final secondaryText = _formType == EmailSignInFormType.signIn ?'Need an Account ? Register':
        'Have an Account? Sign In';
    bool submitEnable = widget.emailValidator.isValidEmail(_email) &&
        widget.passwordValidator.isValidPassword( _password) && !_isloading;

    return[
        _buildEmailTextField(),
      SizedBox(height: 8.0),
        _buildPasswordTextField(),
      SizedBox(height: 16.0),
      FormSubmitButton(primaryText, Colors.indigo, Colors.white, 15.0,
          8.0,submitEnable?_submit:null, 50.0),
      SizedBox(height:8.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed:!_isloading ?_toggleFormType : null,
      )
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =_submitted && !widget.passwordValidator.isValidPassword(_password);
    return TextField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        decoration: InputDecoration(
          labelText: 'Password',
          errorText: showErrorText?widget.invalidPasswordErrorText:null,
          enabled: _isloading==false,

        ),
        obscureText: true ,
        textInputAction:  TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (_password)=>_updateState(),
      );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValidEmail(_email);
    return TextField(

        controller: _emailController,
        focusNode: _emailFocusNode,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
          errorText: showErrorText?widget.invalidEmailErrorText:null,
          enabled: _isloading == false,
        ),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction:  TextInputAction.next,
      onEditingComplete: _emailEditingComplete ,
      onChanged: (_email)=>_updateState(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }

  _updateState() {
    setState(() {

    });
  }
}
