import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easyrecord/screens/userprofile.dart';

class UserManagement {
  storeNewUser(users, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData({ 'email': users.email, 'uid': users.uid})
        .then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserProfile())))
        .catchError((e) {
      print(e);
    });
  }
}