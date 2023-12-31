import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xtreme/core/alert_dialog/top_notification.dart';
import 'package:xtreme/sign_in/models/firestore_user.dart';

class FirestoreUserNotifier extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Exposing authStateChanges stream to listen to authentication state changes.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  Stream<FirestoreUser?> get firestoreUser => (fetchFirestoreuser());


  /// Function to sign in with email and password using FirebaseAuth.
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("(Authentication Failed): $e");
    }
    return false;
  }


  get currentUser => _auth.currentUser;


  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  Stream<FirestoreUser> fetchFirestoreuser() {
    if (_auth.currentUser == null) {
      return Stream.empty();
    }
    return _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .snapshots()
        .map((snap) => FirestoreUser.fromMap(snap.data()!));
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
