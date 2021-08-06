import 'package:easyrecord/screens/studentslist.dart';
import 'package:easyrecord/screens/userprofile.dart';
import 'package:flutter/material.dart';

class HomeSupervisor extends StatefulWidget {
  @override
  _HomeSupervisorState createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('Home'),
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
            'EASYRECORDS',style: TextStyle(fontSize: 30),
              ),
             SizedBox(height: 20.0),
             Image(
               image: AssetImage('assets/logo.png'),
             ),
          SizedBox(height: 20.0),
          Container(
           height:70,
          width: 270,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
           textColor: Colors.white,
           color: Colors.green[600],
             child: Text('Set New Meeting',style: TextStyle(fontSize: 27),),
           onPressed: () {

    },
    ),
    ),
           SizedBox(height: 20.0),
           Container(
           height:70,
           width: 270,
           padding: EdgeInsets.all(10),
             child: RaisedButton(
          textColor: Colors.white,
             color: Colors.green[600],
              child: Text('Meeting Records',style: TextStyle(fontSize: 27),),
             onPressed: () {

               },
               ),
               ),
             SizedBox(height: 20.0),
           Container(
           height:70,
           width: 270,
           padding: EdgeInsets.all(10),
            child: RaisedButton(
            textColor: Colors.white,
            color: Colors.green[600],
            child: Text('Students List',style: TextStyle(fontSize: 27),),
            onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentList()),
                );
          },
        ),
      ),
             SizedBox(height: 20.0),
             Container(
               height:70,
               width: 270,
               padding: EdgeInsets.all(10),
               child: RaisedButton(
                 textColor: Colors.white,
                 color: Colors.green[600],
                 child: Text('User Profile',style: TextStyle(fontSize: 27),),
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => UserProfile()),
                   );

                 },
               ),
             ),





    ])))
    );
  }
}
