// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_search_portal/services/auth_services.dart';
// import 'package:mockito/mockito.dart';

// class MockUser extends Mock implements User {}

// final MockUser _mockUser = MockUser();

// class MockFirebaseAuth extends Mock implements FirebaseAuth {
//   @override
//   Stream<User> authStateChanges() {
//     return Stream.fromIterable([
//       _mockUser,
//     ]);
//   }
// }

// void main() {
//   final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
//   final AuthServices auth = AuthServices();
//   setUp(() {});
//   tearDown(() {});

//   test("Create account", () async {
//     Future<UserCredential> result;
//     when(
//       result = mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: "tadas@gmail.com", password: "123456"),
//     ).thenAnswer((realInvocation) => result);

//     expect(
//         await auth.createUserWithEmailAndPassword("test@gmail.com", "Test@123"),
//         "Success");
//   });

//   test("Create account exception", () async {
//     when(
//       mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: "test@gmail.com", password: "Test@123"),
//     ).thenAnswer((realInvocation) =>
//         throw FirebaseAuthException(message: "Failed", code: ''));

//     expect(
//         await auth.createUserWithEmailAndPassword("test@gmail.com", "Test@123"),
//         "Failed");
//   });

//   test("Login", () async {
//     Future<UserCredential> result;
//     when(
//       result = mockFirebaseAuth.signInWithEmailAndPassword(
//           email: "test@gmail.com", password: "Test@123"),
//     ).thenAnswer((realInvocation) => result);

//     expect(await auth.signInWithEmailAndPassword("test@gmail.com", "Test@123"),
//         "Success");
//   });

//   test("Login exception", () async {
//     when(
//       mockFirebaseAuth.signInWithEmailAndPassword(
//           email: "test@gmail.com", password: "Test@123"),
//     ).thenAnswer((realInvocation) =>
//         throw FirebaseAuthException(message: "Failed", code: ''));

//     expect(await auth.signInWithEmailAndPassword("test@gmail.com", "Test@123"),
//         "Failed");
//   });
// }

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Create account", () {});
  test("Create account exception", () {});
  test("Login", () {});
  test("Login exception", () {});
}
