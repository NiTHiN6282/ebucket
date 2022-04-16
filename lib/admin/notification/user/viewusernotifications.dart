import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/notification/user/adminusernotificationdetails.dart';
import 'package:flutter/material.dart';

class AdminViewUserNotifications extends StatefulWidget {
  const AdminViewUserNotifications({Key? key}) : super(key: key);

  @override
  _AdminViewUserNotificationsState createState() =>
      _AdminViewUserNotificationsState();
}

class _AdminViewUserNotificationsState
    extends State<AdminViewUserNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("User Notifications"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('User Notifications')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('no notifications found'));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff009E60),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 100,
                            width: 200,
                            child: Center(
                              child: ListTile(
                                leading: Text((index + 1).toString()),
                                title:
                                    Text(snapshot.data!.docs[index]['title']),
                                subtitle: Text(
                                    snapshot.data!.docs[index]['description']),
                                trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('User Notifications')
                                          .doc(snapshot.data!.docs[index]
                                              ['unid'])
                                          .delete()
                                          .then((value) {
                                        showsnackbar('Notification deleted');
                                        Navigator.pop(context);
                                      });
                                    }),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminUserNotificationDetails(
                                        title: snapshot.data!.docs[index]
                                            ['title'],
                                        description: snapshot.data!.docs[index]
                                            ['description'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      });
                }
              }),
        ),
      ),
    );
  }

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
