import 'package:ebucket/admin/notification/agent/addagentnotification.dart';
import 'package:ebucket/admin/notification/agent/viewagentnotifications.dart';
import 'package:flutter/material.dart';

class AdminAgentNotification extends StatefulWidget {
  const AdminAgentNotification({Key? key}) : super(key: key);

  @override
  _AdminAgentNotificationState createState() => _AdminAgentNotificationState();
}

class _AdminAgentNotificationState extends State<AdminAgentNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Agent Notification"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xff00adb5),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("View Agent Notifications"),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AdminViewAgentNotifications()));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 100,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      color: Color(0xff00adb5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("Sent Agent Notification"),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddAgentNotification()));
                        },
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
