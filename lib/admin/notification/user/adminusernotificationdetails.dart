import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AdminUserNotificationDetails extends StatefulWidget {
  dynamic title;
  dynamic description;

  AdminUserNotificationDetails({Key? key, this.title, this.description})
      : super(key: key);

  @override
  _AdminUserNotificationDetailsState createState() =>
      _AdminUserNotificationDetailsState();
}

class _AdminUserNotificationDetailsState
    extends State<AdminUserNotificationDetails> {
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
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton.icon(
                    onPressed: () {
                      launch("https://google.com/");
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("delete")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showalert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Do you want to delete?"),
            title: const Text("alertbox"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("confirm")),
              TextButton(onPressed: () {}, child: const Text("cancel"))
            ],
          );
        });
  }
}
