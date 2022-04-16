import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAgentNotification extends StatefulWidget {
  const AddAgentNotification({Key? key}) : super(key: key);

  @override
  _AddAgentNotificationState createState() => _AddAgentNotificationState();
}

class _AddAgentNotificationState extends State<AddAgentNotification> {
  dynamic anid;

  var addagentnotificationkey = GlobalKey<FormState>();
  TextEditingController titleinputcontroller = TextEditingController();
  TextEditingController descriptioninputcontroller = TextEditingController();

  @override
  void initState() {
    anid = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sent Agent Notifications"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: addagentnotificationkey,
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
                    "Add Agent Notification",
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
                          if (addagentnotificationkey.currentState!
                              .validate()) {
                            FirebaseFirestore.instance
                                .collection('Agent Notifications')
                                .doc(anid)
                                .set({
                              'anid': anid,
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
