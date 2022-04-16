import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgentNotificationDetails extends StatefulWidget {
  dynamic title;
  dynamic description;

  AgentNotificationDetails({Key? key, this.title, this.description})
      : super(key: key);

  @override
  _AgentNotificationDetailsState createState() =>
      _AgentNotificationDetailsState();
}

class _AgentNotificationDetailsState extends State<AgentNotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(widget.title),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.description),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
