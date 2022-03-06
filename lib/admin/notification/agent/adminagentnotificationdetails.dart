import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminAgentNotificationDetails extends StatefulWidget {
  var title;
  var description;

  AdminAgentNotificationDetails({this.title, this.description});

  @override
  _AdminAgentNotificationDetailsState createState() =>
      _AdminAgentNotificationDetailsState();
}

class _AdminAgentNotificationDetailsState
    extends State<AdminAgentNotificationDetails> {
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
              Container(
                width: 150,
                height: 50,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(50),
                //       color: Colors.green,
                // ),

                child: ElevatedButton.icon(
                    onPressed: () {
                      // showalert();
                      launch("https://google.com/");
                    },
                    icon: Icon(Icons.delete),
                    label: Text("delete")),
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
            content: Text("Do you want to delete?"),
            title: Text("alertbox"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("confirm")),
              TextButton(onPressed: () {}, child: Text("cancel"))
            ],
          );
        });
  }
}
