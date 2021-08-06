import 'package:easyrecord/screens/view_meeting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMeeting extends StatefulWidget {
  @override
  _EditMeetingState createState() => _EditMeetingState();
}

class _EditMeetingState extends State<EditMeeting> {
  DateTime date;
  String title;
  String notes;
  String comments;
  String upload;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  TextEditingController _commentsController = TextEditingController();

  /* @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  } */

  Widget _buildDate() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text('Date',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextFormField(
              onSaved: (val) {
                date = selectedDate;
              },
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                // labelText: "Date",
                icon: Icon(Icons.calendar_today),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date.toString();
      });
  }

  Widget _buildTitle() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Title',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            maxLength: 50,

            /*validator: (String values) {
              if (values.isEmpty) {
                return 'Title is Required';
              }

              return null;
            },
            onSaved: (String values) {
              title = values;
            }, */
          ),
        ),
      ],
    );
  }

  Widget _buildNotes() {
    return Column(
      children: <Widget>[
        SizedBox(height: 13),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Notes Progress',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _notesController,
            decoration: InputDecoration(
                labelText: 'Type your notes here',
                hintText: 'type something here',
                border: OutlineInputBorder()),
            maxLines: 10,
            /*  validator: (String values) {
              if (values.isEmpty) {
                return 'Notes are Required';
              }

              return null;
            },
            onSaved: (String values) {
              notes = values;
            }, */
          ),
        ),
      ],
    );
  }

  Widget _buildComments() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Comments',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _commentsController,
            decoration: InputDecoration(
                labelText: 'Type your comments here',
                hintText: 'type something here',
                border: OutlineInputBorder()),
            maxLines: 10,
            /* validator: (String values) {
              if (values.isEmpty) {
                return 'Comments are Required';
              }

              return null;
            },
            onSaved: (String values) {
              comments = values;
            }, */
          ),
        ),
      ],
    );
  }

  Widget _buildUpload() {
    return Column(
      children: <Widget>[
        SizedBox(height: 25),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Upload your files here:',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton.icon(
              label: Text('Upload your files'),
              icon: Icon(Icons.cloud_upload),
              onPressed: (null),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Meeting"),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Edit the meeting here!',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildDate(),
                _buildTitle(),
                _buildNotes(),
                _buildComments(),
                _buildUpload(),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                    textColor: Colors.white,
                    color: Colors.green[600],
                    child: Text(
                      'SAVE',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: ()
                    {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => ViewMeeting()));
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
