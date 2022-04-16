import 'package:ebucket/admin/notification/agent/adminagentnotification.dart';
import 'package:ebucket/admin/notification/user/adminusernotification.dart';
import 'package:flutter/material.dart';

class AdminNotification extends StatefulWidget {
  const AdminNotification({Key? key}) : super(key: key);

  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sent Notifications"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff00adb5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Agent"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminAgentNotification()));
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff00adb5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("User"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminUserNotification()));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
