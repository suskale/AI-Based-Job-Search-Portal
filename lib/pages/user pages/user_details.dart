import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/shared/profile_widget.dart';

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    final applicant =
        ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: FirebaseAuth.instance.currentUser!.photoURL!,
            onClicked: () {},
          ),
          const SizedBox(height: 24),
          buildName(applicant["name"], applicant["email"]),
          const SizedBox(height: 24),
          buildAbout(applicant["qualification"]),
        ],
      ),
    );
  }

  Widget buildName(String name, String email) => Column(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(String qualification) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              qualification,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
