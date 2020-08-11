import 'package:first_flutter_app/app/interfaces/auth_base.dart';
import 'package:first_flutter_app/app/landing_page.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/services/auth.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context)=> Auth(),
      child: MaterialApp(
        title: 'First Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(


        ),
      ),
    );
 
  }
}
