import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgentDetails extends StatefulWidget {
  dynamic status;
  dynamic uid;
  dynamic names;
  dynamic email;
  dynamic address;
  dynamic phoneno;
  dynamic location;

  AgentDetails(
      {Key? key,
      this.names,
      this.email,
      this.address,
      this.phoneno,
      this.location,
      this.status,
      this.uid})
      : super(key: key);

  @override
  _AgentDetailsState createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Agent Profile",
                style: TextStyle(
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Name: ",
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.names,
                          style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Email: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.email,
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Address: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.address,
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Phone: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.phoneno,
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Location: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(widget.uid)
                              .update({
                            'status': 1,
                          });
                          showsnackbar("Approved");
                        },
                        icon: const Icon(Icons.done),
                        label: const Text("Approve")),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(widget.uid)
                              .update({
                            'status': 0,
                          });
                          showsnackbar("Rejected");
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("Reject")),
                  ],
                ),
              )
            ],
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
