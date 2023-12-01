import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xtreme/sign_in/models/firestore_user.dart';

class FirestoreUserNotifier extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  Stream<FirestoreUser> get firestoreUser => (fetchFirestoreuser());
  Future<UserCredential?> signInWithEmailAndPassword() async {
    FirebaseAuth auth = FirebaseAuth.instanceFor(app: Firebase.app());

    OAuthProvider provider = OAuthProvider('oidc.kfupm');
    provider.setCustomParameters({
      'tenant': '29b4b088-d27d-4129-b9f9-8637b59ea4b3',
      "client_secret": "e09a665a-9ff1-4bff-9c5a-a27a41d92865",
      "callback_url": "https://xtreme-flutter-weekend.firebaseapp.com/__/auth/handler",
      // "client_id": "0d54409a-f271-4e35-8092-0a2039f9a41d",
      // "redirect_uri": "https://xtreme-flutter-weekend.firebaseapp.com/__/auth/handler",
    });
    final user = await auth.signInWithProvider(provider);
    print(user);
    print(user.credential);
  }

  Future<UserCredential?> signUpWithEmailAndPassword(String email, String password) async {
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
