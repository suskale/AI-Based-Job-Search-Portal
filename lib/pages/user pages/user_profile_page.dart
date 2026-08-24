import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/shared/profile_widget.dart';
import 'package:job_search_portal/shared/text_field_widget.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: FirebaseAuth.instance.currentUser?.photoURL?? 'https://ak8.picdn.net/shutterstock/videos/10984688/thumb/1.jpg',
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Full Name',
                text: currentUser?.name?? '',
                onChanged: (name) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Email',
                text: currentUser?.email?? '',
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Mobile Number',
                text: currentUser?.mobileNo?? '',
                onChanged: (mobileNo) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Qualification',
                text: currentUser?.qualification?? '',
                maxLines: 5,
                onChanged: (mobileNo) {},
              ),
            ],
          ),
        ),
      );
}
