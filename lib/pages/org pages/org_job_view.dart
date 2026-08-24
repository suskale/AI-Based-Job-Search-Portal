// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/pages/user%20pages/user_profile_page.dart';
import 'package:job_search_portal/services/database_services.dart';

class OrgJobViewPage extends StatefulWidget {
  OrgJobViewPage({Key? key}) : super(key: key);

  @override
  State<OrgJobViewPage> createState() => _OrgJobViewPageState();
}

class _OrgJobViewPageState extends State<OrgJobViewPage> {
  DatabaseServices databaseService = DatabaseServices(uid: currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    final documentSnapshot =
        ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
    return Scaffold(
      appBar: AppBar(
        title: Text("Job View"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Company Name :" + documentSnapshot["companyName"]),
              SizedBox(height: 20),
              Text("Company Type :" + documentSnapshot["companyType"]),
              SizedBox(height: 20),
              Text("Designation :" + documentSnapshot["designation"]),
              SizedBox(height: 20),
              Text("Salary :" + documentSnapshot["salary"].toString()),
              SizedBox(height: 20),
              Text("Description :" + documentSnapshot["description"]),
              SizedBox(height: 20),
              Text(".\n" * 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .where("jobs." + documentSnapshot.id, isEqualTo: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot applicant) {
                          return ListTile(
                            title: Text(applicant["name"]),
                            onTap: () {
                              Navigator.pushNamed(context, "/userDetailPage",
                                  arguments: applicant);
                            },
                          );
                        }).toList(),
                      );
                    } else {
                      return Text("No Applicants");
                    }
                  },
                );
              });
        },
        label: Text("View Applicants"),
      ),
    );
  }
}
