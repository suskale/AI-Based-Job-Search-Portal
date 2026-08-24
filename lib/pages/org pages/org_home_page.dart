// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/orgs.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/services/auth_services.dart';
import 'package:job_search_portal/services/database_services.dart';
import 'package:provider/provider.dart';

class OrgHomePage extends StatefulWidget {
  const OrgHomePage({Key? key}) : super(key: key);

  @override
  State<OrgHomePage> createState() => _OrgHomePageState();
}

class _OrgHomePageState extends State<OrgHomePage> {
  int index = 0;
  final databaseService = DatabaseServices(uid: currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final authService = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Org Home Page"),
        actions: [
          ElevatedButton(
              child: Text("Log out"),
              onPressed: () async {
                try {
                  if (user!.providerData[0].providerId == "google.com") {
                    await authService.googleSignOut();
                  } else {
                    await authService.signOut();
                  }
                  currentOrg = null;
                } catch (e) {
                  print(e);
                }
              }),
        ],
      ),
      body: Center(
          child: currentOrg != null
              ? StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("jobs")
                      .where("jid", isEqualTo: currentOrg!.oid.trim())
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          // print(document.id);
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Card(
                              child: ListTile(
                                title: Text(document["companyName"]),
                                subtitle: Text(document["companyType"] +
                                    "\n" +
                                    document["designation"] +
                                    "\n" +
                                    document["salary"] +
                                    "LPA"),
                                isThreeLine: true,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/orgJobViewPage",
                                      arguments: document);
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, "/jobFormPage");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
    );
  }
}
