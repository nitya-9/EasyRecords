import 'package:easyrecord/DatabaseManager/database.dart';
import 'package:easyrecord/screens/edit_meeting.dart';
import 'package:flutter/material.dart';
import 'package:easyrecord/models/details.dart';

class ViewMeeting extends StatefulWidget {
  final Database value;

  ViewMeeting({Key key, this.value}) : super(key: key);

  @override
  _ViewMeetingState createState() => _ViewMeetingState();
}

class _ViewMeetingState extends State<ViewMeeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Meeting'),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Date :',
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' ${widget.value.date2}',
                    style: const TextStyle(fontSize: 21),
                  ),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Title :',
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${widget.value.title2}',
                      style: const TextStyle(fontSize: 21)),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notes Progress :',
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${widget.value.notes2}',
                      style: const TextStyle(fontSize: 21)),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Comments :',
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${widget.value.comments2}',
                      style: const TextStyle(fontSize: 21)),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Upload your files here:',
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FlatButton.icon(
                    label: Text('Files.jpg'),
                    icon: Icon(Icons.folder_open),
                    onPressed: (null),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditMeeting()));
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
