import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Database {
  FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
      String title, String notes, String comments, String upload) async {
    try {
      await firestore.collection("meetings").add({
        'timestamp': FieldValue.serverTimestamp(),
        'title': title,
        'notes': notes,
        'comments': comments,
        'upload': upload,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("meetings").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
      await firestore.collection('meetings').orderBy('timestamp').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "title": doc['title'],
            "notes": doc["notes"],
            "comments": doc['comments'],
            "upload": doc['upload']
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String title, String notes, String comments,
      String upload) async {
    try {
      await firestore.collection("meetings").doc(id).update({
        'title': title,
        'notes': notes,
        'comments': comments,
        'upload': upload,
      });
    } catch (e) {
      print(e);
    }
  }
}
