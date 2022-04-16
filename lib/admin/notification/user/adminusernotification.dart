import 'package:ebucket/admin/notification/user/addusernotification.dart';
import 'package:ebucket/admin/notification/user/viewusernotifications.dart';
import 'package:flutter/material.dart';

class AdminUserNotification extends StatefulWidget {
  const AdminUserNotification({Key? key}) : super(key: key);

  @override
  _AdminUserNotificationState createState() => _AdminUserNotificationState();
}

class _AdminUserNotificationState extends State<AdminUserNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("User Notification"),
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
                      child: Text("View User Notifications"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AdminViewUserNotifications()));
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
                      child: Text("Sent User Notification"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddUserNotification()));
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
