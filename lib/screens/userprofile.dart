import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:easyrecord/screens/changepassword.dart';
import 'package:easyrecord/DatabaseManager/DatabaseManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easyrecord/services/AuthenticationService.dart';
import 'package:easyrecord/screens/editprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final AuthenticationService _auth = AuthenticationService();
  String name;
  String email;
  String contactnum;

  String userProfilesList = '';
  String userID = "";
  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    FirebaseUser getUsers = await FirebaseAuth.instance.currentUser();
    userID = getUsers.uid;
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (FirebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        name = ds.data['name'];
        print(name);
        email = ds.data['email'];
        print(email);
        contactnum = ds.data['contactnum'];
        print(contactnum);
      }).catchError((e) {
        print(e);
      });

  }
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsers();
  }

  getData(String name, String email, String contactnum, String userID) async {
    await DatabaseManager().getUsers();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('User Profile'),
    backgroundColor: Colors.green[600],
    centerTitle: true,
    elevation: 0,
    ),
     body: Padding(
      padding: EdgeInsets.all(10),
      child:Center(
       child: ListView(

        children: <Widget>[
        Container(
           margin: EdgeInsets.only(left: 130.0),
           child: Text(
            'My Profile',style: TextStyle(fontSize: 30),
          ),
        ),
          Container(
            margin: EdgeInsets.only(left: 12.0),
            padding: EdgeInsets.all(10),
            child: Image(
              image: AssetImage('assets/usericon.png'),
              width: 100.0,
              height: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Name',style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:
                Text('$name', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

            ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Email',style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:Text('$email',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

            ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Contact Number',style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:
              Text('$contactnum',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

            ),

          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text:TextSpan(
              text: 'Change Password',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePassword()),
                  );
                },

              style: TextStyle(fontSize: 20, color: Colors.blue,
                decoration: TextDecoration.underline,),
                ),
            ),
          ),
          Container(
              height:70,
              width: 20,
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.green[600],
                child: Text('Edit',
                  style: TextStyle(fontSize: 20),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
              )
          )



  ]))));
  }




}
