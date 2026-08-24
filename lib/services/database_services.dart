// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_search_portal/models/job.dart';
import 'package:job_search_portal/models/orgs.dart';
import 'package:job_search_portal/models/user.dart';

class DatabaseServices {
  String? uid;
  DatabaseServices({
    this.uid,
  });

// reference to users collection
  final userCollection = FirebaseFirestore.instance.collection("users");

  // reference to orgs collection
  final orgCollection = FirebaseFirestore.instance.collection("orgs");

  // reference to jobs collection
  final jobCollection = FirebaseFirestore.instance.collection("jobs");

// Update data of the user
  Future updateUserData(User user) async {
    // print("update data");
    return userCollection.doc(uid).set(user.toJson());
  }

  // Get user data from firestore
  Future<User?> getUserData() async {
    var user = await userCollection.doc(uid).get().then((value) {
      return User.fromJson(value.data());
    });
    // print(user.name);
    // print(user.role);
    return user;
  }

  // Set Org data to firestore
  Future<void> setOrgData() async {
    await orgCollection.doc(uid!.trim()).set(Org(oid: uid!).toJson());
  }

  // Get Org data from firestore
  Future<Org?> getOrgData() async {
    var org = await orgCollection.doc(uid!.trim()).get().then((value) {
      return Org.fromJson(value.data());
    });
    // print(org!.name);
    return org;
  }

  // add data to jobs collection
  Future<void> addJob(Job job) async {
    await jobCollection.add(job.toJson());
  }

  // add applicants who applied for the job
  Future<void> addApplicants(
      DocumentSnapshot documentSnapshot, String applicantID) async {
    await jobCollection.doc(documentSnapshot.id).update({
      "applicants": FieldValue.arrayUnion([applicantID]),
    });
  }

  // add job to users profile so he can view applied jobs
  Future<void> addJobToUser() async {
    await userCollection
        .doc(currentUser!.uid)
        .update({"jobs": currentUser!.jobs});
  }
}
