// ignore_for_file: unused_field, unused_element, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_search_portal/models/user.dart';
import 'package:job_search_portal/services/database_services.dart';

class AuthServices {
  // Instance of FirebaseAuth
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  // method to map firebaseUser to User class
  User? _userFromFirebaseUser(auth.User firebaseUser) {
    if (firebaseUser == null) {
      return null;
    } else {
      return User(email: firebaseUser.email, uid: firebaseUser.uid);
    }
  }

  // Method to map Google User to User Class
  User? _userFromGoogle(GoogleSignInAccount googleSignInAccount) {
    if (googleSignInAccount == null) {
      return null;
    } else {
      return User(
          email: googleSignInAccount.email,
          uid: googleSignInAccount.id,
          name: googleSignInAccount.displayName!);
    }
  }

  // Method to create user with email and password
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final firebaseUser = result.user;
    final user = _userFromFirebaseUser(firebaseUser!);
    // Instance of DatabaseServices
    final databaseService = DatabaseServices(uid: user!.uid);
    // Create the data of user in firestore
    databaseService.updateUserData(user);
    return user;
  }

  // Method to sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    final firebaseUser = result.user;
    final user = _userFromFirebaseUser(firebaseUser!);
    return user;
  }

  // Method to sign up with google
  Future<User?> signUpWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return null;
    } else {
      final googleAuth = await googleSignInAccount.authentication;
      final googleCredential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      _firebaseAuth.signInWithCredential(googleCredential);
      final user = _userFromGoogle(googleSignInAccount);
      // Instance of DatabaseServices
      final databaseService = DatabaseServices(uid: user!.uid);
      // Create the data of user in firestore
      databaseService.updateUserData(user);
      return user;
    }
  }

  // Method to sign in with google
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return null;
    } else {
      final googleAuth = await googleSignInAccount.authentication;
      final googleCredential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      _firebaseAuth.signInWithCredential(googleCredential);
      final user = _userFromGoogle(googleSignInAccount);
      return user;
    }
  }

  // Method to sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Method to Sign Out from Google
  Future<void> googleSignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    signOut();
  }
}
