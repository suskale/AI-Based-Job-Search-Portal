// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/services/database_services.dart';

class UserJobViewPage extends StatefulWidget {
  UserJobViewPage({Key? key}) : super(key: key);

  @override
  State<UserJobViewPage> createState() => _UserJobViewPageState();
}

class _UserJobViewPageState extends State<UserJobViewPage> {
  DatabaseServices databaseService = DatabaseServices(uid: currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    final documentSnapshot =
        ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
    bool status = currentUser!.jobs[documentSnapshot.id] ?? false;
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
        onPressed: status
            ? null
            : () {
                setState(() {
                  status = currentUser!.jobs[documentSnapshot.id] ?? false;
                  databaseService.addApplicants(
                      documentSnapshot, currentUser!.uid!);
                  currentUser!.jobs[documentSnapshot.id] = true;
                  databaseService.addJobToUser();
                });
              },
        label: Text(status ? "Applied" : "Apply Now"),
      ),
    );
  }
}
