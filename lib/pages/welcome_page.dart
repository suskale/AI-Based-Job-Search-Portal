// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_search_portal/shared/rounded_buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Page"),
      ),
      body: Center(
        child: Column(
          children: [
            RoundedButton(
              text: "Get Started",
              icon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.pushNamed(context, "/loginPage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
