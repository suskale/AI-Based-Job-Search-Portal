// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_search_portal/pages/login_page.dart';

// void main() {
//   testWidgets("Login In", (WidgetTester tester) async {
//     // Find all widgets
//     final emailField = find.byKey(ValueKey("emailField"));
//     final passwordField = find.byKey(ValueKey("passwordField"));
//     final loginButton = find.byKey(ValueKey("loginButton"));

//     // Execute acutal test
//     await tester.pumpWidget(MaterialApp(
//       home: LoginPage(),
//     ));
//     await tester.enterText(emailField, "demo70@gmail.com");
//     await tester.enterText(passwordField, "Pass@123");
//     await tester.tap(loginButton);
//     await tester.pump();

//     // Check outputs
//     expect(find.text("demo5@gmail.com"), findsNWidgets(3));
//   });
// }

void main() {
  testWidgets("Sign Up as user", (WidgetTester tester) async {});
  testWidgets("Login In as user", (WidgetTester tester) async {});
  testWidgets("View Jobs", (WidgetTester tester) async {});
  testWidgets("Apply for jobs", (WidgetTester tester) async {});
}
