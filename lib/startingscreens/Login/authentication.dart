import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  User? get user {
    if (isSignedIn == false) {
      return null;
    } else {
      return _auth.currentUser;
    }
  }

  bool get isSignedIn {
    if (_auth.currentUser == null) {
      return false;
    }
    return true;
  }

  void resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<String?> signUp(
      {required String username,
      required String email,
      required String password,
      required String role}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({'username': username, 'email': email, 'role': role});

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      if (kDebugMode) {
        print('Didnt signup: $e');
      }
      return e.toString();
    }
  }

  Future<String?> logIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  void deleteUser() async {
    await user?.delete();
  }

  Future<String?> updateEmail({required String email}) async {
    try {
      await user?.updateEmail(email);

      final ref = db.collection("users").doc(_auth.currentUser!.uid);
      ref.update({"email": email}).then(
        (value) {
          if (kDebugMode) {
            print("Email successfully updated!");
          }
        },
        onError: (e) {
          if (kDebugMode) {
            print("Error updating email: $e");
          }
        },
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> updatePassword({required String password}) async {
    try {
      await user?.updatePassword(password);

      final ref = db.collection("users").doc(_auth.currentUser!.uid);
      ref.update({"password": password}).then(
        (value) {
          if (kDebugMode) {
            print("Password successfully updated!");
          }
        },
        onError: (e) {
          if (kDebugMode) {
            print("Error updating password: $e");
          }
        },
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
