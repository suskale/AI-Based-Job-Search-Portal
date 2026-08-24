import 'package:job_search_portal/models/orgs.dart';

class Job {
  String? jid;
  String? companyName;
  String? companyType;
  String? designation;
  String? salary;
  String? description;
  List? applicants;

  Job({
    this.jid,
    this.companyName,
    this.companyType,
    this.designation,
    this.description,
    this.salary,
    this.applicants = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      "jid": jid!.trim(),
      "companyName": companyName,
      "companyType": companyType,
      "designation": designation,
      "description": description,
      "salary": salary,
      "applicants": applicants,
    };
  }

  static Job? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    } else {
      return Job(
        jid: currentOrg!.oid,
        companyName: json["companyName"],
        companyType: json["companyType"],
        designation: json["designation"],
        salary: json["salary"],
        description: json["description"],
        applicants: json["applicants"],
      );
    }
  }
}
