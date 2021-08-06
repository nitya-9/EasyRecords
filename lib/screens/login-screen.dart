import 'package:easyrecord/screens/create-new-account.dart';
import 'package:easyrecord/screens/forgot-password.dart';
import 'package:easyrecord/screens/homestudent.dart';
import 'package:easyrecord/widgets/rounded-button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easyrecord/models/pallete.dart';
import 'package:easyrecord/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: '',
        ),
        Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'EasyRecords',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),

                ),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: kBodyText.copyWith(
                        color: Colors.blue,),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton2(buttonName: 'Login',

                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateNewAccount()),
                  );
                },
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText.copyWith(
                      color: Colors.blue,),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: Colors.blue,))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
