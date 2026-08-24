// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_search_portal/models/orgs.dart';
import 'package:job_search_portal/models/user.dart';

import 'package:job_search_portal/services/auth_services.dart';
import 'package:job_search_portal/services/database_services.dart';
import 'package:job_search_portal/shared/rounded_buttons.dart';
import 'package:job_search_portal/shared/validators.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMsg = "";
  String _email = "";
  String _password = "";
  bool showPassword = false;

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: TextFormField(
                        key: Key("emailField"),
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        onChanged: (emailValue) {
                          _email = emailValue;
                        },
                        validator: emailValidate,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        key: Key("passwordField"),
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.enhanced_encryption),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye_rounded,
                              )),
                        ),
                        obscureText: !showPassword,
                        onChanged: (passwordValue) {
                          _password = passwordValue;
                        },
                        validator: passwordValidate,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  key: Key("loginButton"),
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      try {
                        final result = await authService
                            .signInWithEmailAndPassword(_email, _password);
                        DatabaseServices databaseService =
                            DatabaseServices(uid: result!.uid!.trim());
                        currentUser = await databaseService.getUserData();
                        if (currentUser!.role != "user") {
                          currentOrg = await databaseService.getOrgData();
                          if (currentOrg == null) {
                            await databaseService.setOrgData();
                            currentOrg = await databaseService.getOrgData();
                          }
                        }
                        if (currentUser == null) {
                          setState(() {
                            errorMsg = "No user in database";
                          });
                          authService.signOut();
                        } else {
                          Navigator.pop(context);
                        }
                        CircularProgressIndicator();
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          errorMsg = e.message!;
                        });
                      }
                    }
                  },
                  child: Text("Login")),
              SizedBox(height: 5.0),
              Text(
                errorMsg,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signUpPage");
                      },
                      child: Text("Click here."))
                ],
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black,
                endIndent: 10.0,
                height: 30.0,
                indent: 10.0,
              ),
              RoundedElevatedButton(
                label: "Login with Google",
                icon: Icons.g_mobiledata_rounded,
                onPressed: () async {
                  try {
                    final result = await authService.signInWithGoogle();
                    DatabaseServices databaseService =
                        DatabaseServices(uid: result!.uid);
                    currentUser = await databaseService.getUserData();
                    if (currentUser!.role != "user") {
                      currentOrg = await databaseService.getOrgData();
                      if (currentOrg == null) {
                        await databaseService.setOrgData();
                        currentOrg = await databaseService.getOrgData();
                      }
                    }
                    if (currentUser == null) {
                      setState(() {
                        errorMsg = "No user in database";
                      });
                      authService.googleSignOut();
                    } else {
                      Navigator.pop(context);
                    }
                    CircularProgressIndicator();
                  } on PlatformException catch (e) {
                    setState(() {
                      errorMsg = e.message!;
                    });
                  }
                },
              ),
              RoundedElevatedButton(
                icon: Icons.facebook,
                label: "Login with Facebook",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
