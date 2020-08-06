import 'package:first_flutter_app/app/signIn/sign_in_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SignInPage(

      ),
    );

  }
}
