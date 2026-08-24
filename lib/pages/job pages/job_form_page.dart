// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_search_portal/models/job.dart';
import 'package:job_search_portal/models/orgs.dart';
import 'package:job_search_portal/services/database_services.dart';

Map<String, dynamic> newJob = {};

class JobFormPage extends StatefulWidget {
  const JobFormPage({Key? key}) : super(key: key);

  @override
  _JobFormPageState createState() => _JobFormPageState();
}

class _JobFormPageState extends State<JobFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a new Job"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: JobFormField(
                hintText: "Organisation Name",
                valueToSave: "companyName",
              ),
            ),
            SizedBox(height: 5),
            JobFormField(
              hintText: "Organisation Type",
              valueToSave: "companyType",
            ),
            SizedBox(height: 5),
            JobFormField(
              hintText: "Designation",
              valueToSave: "designation",
            ),
            SizedBox(height: 5),
            JobFormField(
              hintText: "Salary in LPA",
              valueToSave: "salary",
            ),
            SizedBox(height: 5),
            JobFormField(
              hintText: "Description",
              valueToSave: "description",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text("Are you sure?"),
                              content:
                                  Text("Do you want to discard the changes"),
                              // ignore: prefer_const_literals_to_create_immutables
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("Yes"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Discard"),
                  ),
                  height: 40,
                  width: 100,
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("Do you want to post new job"),
                              // ignore: prefer_const_literals_to_create_immutables
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("Yes"),
                                  onPressed: () async {
                                    DatabaseServices databaseService =
                                        DatabaseServices(uid: currentOrg!.oid);
                                    print(newJob);
                                    var job = Job.fromJson(newJob);
                                    if (job != null) {
                                      await databaseService.addJob(job);
                                      Navigator.pop(context);
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Post"),
                  ),
                  height: 40,
                  width: 100,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class JobFormField extends StatelessWidget {
  String hintText;
  dynamic valueToSave = "";
  JobFormField({Key? key, this.hintText = "", this.valueToSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(Icons.edit),
        ),
        onChanged: (value) {
          newJob[valueToSave] = value;
        },
      ),
    );
  }
}
