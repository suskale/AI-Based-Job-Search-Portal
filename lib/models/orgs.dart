class Org {
  String name;
  String oid;
  Org({
    required this.oid,
    this.name = "Org Name",
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'oid': oid,
    };
  }

  static Org? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return Org(
      name: json['name'],
      oid: json['oid'],
    );
  }
}

Org? currentOrg;
