import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
  Firestore.instance.collection('users');

  Future<void> createUserData(
      String name, String email, String contactnum, String uid) async {
    return await profileList
        .document(uid)
        .setData({'name': name, 'email': email, 'contactnum': contactnum});
  }

  Future updateUserList(String name, String email, String contactnum, String uid) async {
    return await profileList.document(uid).updateData({
      'name': name, 'email': email, 'contactnum': contactnum
    });
  }





  Future getUsers() async {

    String itemsList = '';
    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {

        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}