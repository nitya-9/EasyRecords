import 'package:easyrecord/screens/home.dart';
import 'package:flutter/material.dart';

class SetMeeting extends StatefulWidget {
  @override
  _SetMeetingState createState() => _SetMeetingState();
}

class _SetMeetingState extends State<SetMeeting> {
  DateTime date;
  String title;

  DateTime selectedDate = DateTime.now();

  var _dateController = TextEditingController();
  var _titleController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _dateController.dispose();
    super.dispose();
  }

  Widget _buildTitle() {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Title',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _titleController,
            maxLength: 50,
            validator: (String values) {
              if (values.isEmpty) {
                return 'Title is Required';
              }

              return null;
            },
            onSaved: (String values) {
              title = values;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDate() {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set a Meeting"),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Set a date for your new meeting here!',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _buildTitle(),
              _buildDate(),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green[600],
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
