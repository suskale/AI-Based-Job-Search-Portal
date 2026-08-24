class User {
  String? uid;
  String name;
  String? email;
  String role;
  String mobileNo;
  String qualification;
  Map jobs;

  User(
      {this.email,
      this.uid,
      this.name = "User",
      this.role = "user",
      this.mobileNo = "",
      this.qualification = "",
      this.jobs = const {}});

  static User? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return User(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      role: json["role"],
      mobileNo: json["mobileNo"],
      qualification: json["qualification"],
      jobs: json["jobs"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "role": role,
      "mobileNo": mobileNo,
      "qualification": qualification,
      "jobs": jobs,
    };
  }
}

User? currentUser;
