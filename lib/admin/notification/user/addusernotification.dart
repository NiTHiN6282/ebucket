import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserNotification extends StatefulWidget {
  const AddUserNotification({Key? key}) : super(key: key);

  @override
  _AddUserNotificationState createState() => _AddUserNotificationState();
}

class _AddUserNotificationState extends State<AddUserNotification> {
  dynamic unid;
  var addusernotificationkey = GlobalKey<FormState>();
  TextEditingController titleinputcontroller = TextEditingController();
  TextEditingController descriptioninputcontroller = TextEditingController();

  @override
  void initState() {
    unid = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sent User Notifications"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: addusernotificationkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  const Center(
                      child: Text(
                    "Add User Notification",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: titleinputcontroller,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'abc bd',
                        prefixIcon: const Icon(Icons.title),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.length <= 1) return 'mandatory';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: descriptioninputcontroller,
                    decoration: InputDecoration(
                        labelText: 'description',
                        prefixIcon: const Icon(Icons.description),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.length <= 1) return ' pls add description';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (addusernotificationkey.currentState!.validate()) {
                            FirebaseFirestore.instance
                                .collection('User Notifications')
                                .doc(unid)
                                .set({
                              'unid': unid,
                              'title': titleinputcontroller.text,
                              'description': descriptioninputcontroller.text,
                              'status': 1,
                              'date': DateTime.now()
                            }).then((value) {
                              showsnackbar('Notification Added');
                              Navigator.pop(context);
                            });
                          }
                        },
                        icon: const Icon(Icons.send),
                        label: const Text("Sent")),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
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
