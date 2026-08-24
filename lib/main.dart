// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/pages/org%20pages/org_job_view.dart';
import 'package:job_search_portal/pages/user%20pages/user_details.dart';
import 'package:job_search_portal/pages/user%20pages/user_job_view.dart';
import 'package:job_search_portal/pages/job%20pages/job_form_page.dart';
import 'package:job_search_portal/pages/org%20pages/org_home_page.dart';
import 'package:job_search_portal/pages/user%20pages/user_home_page.dart';
import 'package:job_search_portal/pages/user%20pages/user_profile_page.dart';
import 'package:job_search_portal/pages/welcome_page.dart';
import 'package:job_search_portal/pages/login_page.dart';
import 'package:job_search_portal/pages/signup_page.dart';
import 'package:job_search_portal/services/auth_services.dart';
import 'package:job_search_portal/shared/input_decoration_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_search_portal/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(JobApp());
}

class JobApp extends StatefulWidget {
  const JobApp({Key? key}) : super(key: key);

  @override
  _JobAppState createState() => _JobAppState();
}

class _JobAppState extends State<JobApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthServices(),
        ),
      ],
      child: MaterialApp(
        title: "Job Search Portal",
        theme: ThemeData(inputDecorationTheme: inputDecorationTheme),
        home: Wrapper(),
        routes: {
          "/welcomPage": (context) => WelcomePage(),
          "/orgHomePage": (context) => OrgHomePage(),
          "/loginPage": (context) => LoginPage(),
          "/signUpPage": (context) => SignUpPage(),
          "/userHomePage": (context) => UserHomePage(),
          "/userProfilePage": (context) => UserProfilePage(),
          "/userDetailPage": (context) => UserDetailPage(),
          "/userJobViewPage": (context) => UserJobViewPage(),
          "/orgJobViewPage": (context) => OrgJobViewPage(),
          "/jobFormPage": (context) => JobFormPage(),
        },
      ),
    );
  }
}
