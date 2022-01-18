import 'package:flutter/material.dart';

class AgentNotificationDetails extends StatefulWidget {
  var title;
  var description;

  AgentNotificationDetails({this.title, this.description});

  @override
  _AgentNotificationDetailsState createState() => _AgentNotificationDetailsState();
}

class _AgentNotificationDetailsState extends State<AgentNotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(widget.title),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.description),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
