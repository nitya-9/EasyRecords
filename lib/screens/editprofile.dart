import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:easyrecord/screens/changepassword.dart';
import 'package:easyrecord/DatabaseManager/DatabaseManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easyrecord/services/AuthenticationService.dart';



class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactnumController = TextEditingController();

  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();

  }

  fetchUserInfo() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    userID = '';
  }
  updateData(String name, String email, String contactnum, String userID) async {
    await DatabaseManager().updateUserList(name, email, contactnum, userID);

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
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Email',style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _emailController,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Contact Number',style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _contactnumController,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                          ),
                        ),
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
                            child: Text('Save',
                              style: TextStyle(fontSize: 20),),
                            onPressed: () {
                              submitAction(context);
                            },
                          )
                      )



                    ]))));
  }

  submitAction(BuildContext context) {
    updateData(_nameController.text, _emailController.text,
        _contactnumController.text, userID);
    _nameController.clear();
    _emailController.clear();
    _contactnumController.clear();
  }
}
