import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserNotificationDetails extends StatefulWidget {
  dynamic title;
  dynamic description;

  UserNotificationDetails({Key? key, this.title, this.description})
      : super(key: key);

  @override
  _UserNotificationDetailsState createState() =>
      _UserNotificationDetailsState();
}

class _UserNotificationDetailsState extends State<UserNotificationDetails> {
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
