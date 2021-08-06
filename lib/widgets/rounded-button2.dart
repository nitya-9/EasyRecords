import 'package:easyrecord/screens/homestudent.dart';
import 'package:easyrecord/screens/homesupervisor.dart';
import 'package:easyrecord/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:easyrecord/models/pallete.dart';

class RoundedButton2 extends StatelessWidget {
  const RoundedButton2({
    Key key,
    @required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.green[600],
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeSupervisor()),
          );

        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
