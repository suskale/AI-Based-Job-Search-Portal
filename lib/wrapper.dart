// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/pages/login_page.dart';
import 'package:job_search_portal/pages/org%20pages/org_home_page.dart';
import 'package:job_search_portal/pages/user%20pages/user_home_page.dart';
import 'package:job_search_portal/pages/welcome_page.dart';
import 'package:job_search_portal/services/auth_services.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapShot.hasError) {
            return Center(child: Text("Something went Wrong"));
          } else if (snapShot.hasData) {
            if (currentUser != null) {
              if (currentUser!.role == "user") {
                // print("User");
                return UserHomePage();
              } else {
                // print("org");
                return OrgHomePage();
              }
            } else {
              // print("No user in database");
              authService.googleSignOut();
              return LoginPage();
            }
          } else {
            return WelcomePage();
          }
        });
  }
}
