import 'file:///F:/Semester%206/first-flutter-app/lib/app/home/jobs/job_page.dart';
import 'package:first_flutter_app/app/interfaces/auth_base.dart';
import 'package:first_flutter_app/app/interfaces/database.dart';
import 'package:first_flutter_app/app/services/firestore_database.dart';

import 'package:first_flutter_app/app/signIn/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entities/user.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth =  Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            } else {
              return Provider<Database>(
                  create: (context)=> FireStoreDatabase(uid: user.uid),
                  child: JobsPage());
            }
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
