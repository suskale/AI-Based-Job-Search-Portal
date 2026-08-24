String? emailValidate(String? email) {
  if (email == null || email.isEmpty || email == "") {
    return "Email is required.";
  }
  // Creates a regular expression and checks if it matches with given email
  String pattern = r"\w+@+\w+\.\w";
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(email)) {
    return "Invalid E-mail address format.";
  }
  return null;
}

String? passwordValidate(String? password) {
  if (password == null || password.isEmpty || password == "") {
    return "password is required.";
  }
  // Creates a regular expression and checks if it matches with given password
  String pattern =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(password)) {
    return '''Password must be at least 8 characters,
include an uppercase letter, number and symbol.
    ''';
  }

  return null;
}
