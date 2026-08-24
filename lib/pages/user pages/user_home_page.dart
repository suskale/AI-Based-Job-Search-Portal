// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/pages/user%20pages/user_profile_page.dart';
import 'package:job_search_portal/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int index = 0;
  final Set<Widget> pages = {
    UserFeed(),
    UserProfilePage(),
  };
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home Page"),
        elevation: 0.0,
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
                  currentUser = null;
                } catch (e) {
                  print(e);
                }
              }),
        ],
      ),
      body: pages.elementAt(index),
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
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          dynamic conversationObject = {
     'appId': '34515b1ac7a5bd5bdc4a13a6941557d44',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
     };

        KommunicateFlutterPlugin.buildConversation(conversationObject)
            .then((clientConversationId) {
          print("Conversation builder success : " + clientConversationId.toString());
        }).catchError((error) {
          print("Conversation builder error : " + error.toString());
        });
      },
        tooltip: 'help',
        child: const Icon(Icons.help),
      ),

    );
  }
}

class UserFeed extends StatelessWidget {
  const UserFeed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("jobs").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Card(
                  child: ListTile(
                    title: Text(document["companyName"]),
                    subtitle: Text(
                        document["designation"] + "\n" + document["salary"]),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.pushNamed(context, "/userJobViewPage",
                          arguments: document);
                    },
                    trailing: TextButton(
                      child: Text("Apply Now"),
                      onPressed: () {},
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
