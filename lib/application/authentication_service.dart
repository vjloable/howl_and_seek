import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howl_and_seek/presentations/launch_screen.dart';

import '../presentations/redirect_screen.dart';

class AuthenticationService{
  static handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData){
            return const RedirectScreen();
          } else {
            return const LaunchScreen();
          }
        }
    );
  }

  static Future<(String, dynamic)> signUpWithEmailAndPassword(String emailAddress, String password) async {
    (String, dynamic) response = ("fail", null);
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      response = ("success", credential);
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        String message = 'The password provided is too weak.';
        response = ("fail", message);
      } else if (e.code == 'email-already-in-use') {
        String message = 'The account already exists for that email.';
        response = ("fail", message);
      } else {
        response = ("fail", "${e.code}: ${e.message}");
      }
      return response;
    }
  }

  static Future<(String, dynamic)> signInWithEmailAndPassword(String emailAddress, String password) async {
    (String, dynamic) response = ("fail", null);
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      response = ("success", credential);
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        String message = 'No user found for that email.';
        response = ("fail", message);
      } else if (e.code == 'wrong-password') {
        String message = 'Wrong password provided for that user.';
        response = ("fail", message);
      } else {
        response = ("fail", "${e.code}: ${e.message}");
      }
      return response;
    }
  }

  static setName(User user, String name) async {
    await user.updateDisplayName(name);
  }

  static signOut() {
    FirebaseAuth.instance.signOut();
  }

}
