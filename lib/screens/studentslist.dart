import 'package:easyrecord/screens/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:easyrecord/DatabaseManager/DatabaseManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easyrecord/services/AuthenticationService.dart';
import 'package:easyrecord/screens/editprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentList extends StatefulWidget {
  String name;

  @override
  _StudentListState createState() => _StudentListState();
}


class _StudentListState extends State<StudentList> {

  String name;
  String userID = "";
  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    if (FirebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document('')
          .get()
          .then((ds) {
        name = ds.data['name'];
        print(name);
      }).catchError((e) {
        print(e);
      });

  }
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Student List'),
          backgroundColor: Colors.green[600],
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
            child:Center(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        'Students',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Student 1',style: TextStyle(fontSize: 30),
                      ),

                      SizedBox(height: 20.0),
                      Container(
                        height:70,
                        width: 270,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.green[600],
                          child: Text('$name',style: TextStyle(fontSize: 27),),
                          onPressed: () {

                          },
                        ),
                      ),






                    ])))
    );
  }

}
