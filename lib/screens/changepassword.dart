import 'package:flutter/material.dart';
import 'package:easyrecord/models/user_model.dart';
import 'package:easyrecord/view_controller/user_controller.dart';
import 'package:easyrecord/models/locator.dart';

class ChangePassword extends StatefulWidget {
  final UserModel currentUser;

  ChangePassword({this.currentUser});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool checkCurrentPasswordValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Change Password'),
          backgroundColor: Colors.green[600],
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child:Center(
                child: ListView(
                    key: _formKey,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top:10,left: 75.0),
                        child: Text(
                          'Change Password',style: TextStyle(fontSize: 30),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Current Password',style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,

                          decoration: InputDecoration(
                            errorText: checkCurrentPasswordValid
                                ? null
                                : "Please double check your current password",
                            border: OutlineInputBorder(),
                            labelText: 'Current Password',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'New Password',style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: _newPasswordController,

                          decoration: InputDecoration(

                            border: OutlineInputBorder(),
                            labelText: 'New Password',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Confirm New Password',style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: _repeatPasswordController,

                          decoration: InputDecoration(

                            border: OutlineInputBorder(),
                            labelText: 'Confirm New Password',
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
                            onPressed: () async{
                              var userController = locator.get<UserController>();
                              checkCurrentPasswordValid =
                                  await userController.validateCurrentPassword(
                                  _passwordController.text);

                              setState(() {});

                              if (_formKey.currentState.validate() &&
                                  checkCurrentPasswordValid) {
                                userController.updateUserPassword(
                                    _newPasswordController.text);
                                Navigator.pop(context);
                              }


                            },
                          )
                      )



                    ]))));
  }
}