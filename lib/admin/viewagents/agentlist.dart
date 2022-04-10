import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/viewagents/agentdetails.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgentList extends StatefulWidget {
  var status;
  var phone;
  var name;

  AgentList({Key? key, this.status, this.phone, this.name}) : super(key: key);

  @override
  _AgentListState createState() => _AgentListState();
}

class _AgentListState extends State<AgentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Agents List"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .where('usertype', isEqualTo: 'Collecting Agent')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no agent found'));
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: snapshot.data!.docs[index]['status'] == 1
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 100,
                            width: 200,
                            child: Center(
                              child: ListTile(
                                leading: Text((index + 1).toString()),
                                title: Text(snapshot.data!.docs[index]['name']),
                                subtitle:
                                    Text(snapshot.data!.docs[index]['phone']),
                                trailing: IconButton(
                                    icon: Icon(Icons.call, color: Colors.blue),
                                    onPressed: () {
                                      launch(
                                          "tel:${snapshot.data!.docs[index]['phone']}");
                                    }),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AgentDetails(
                                        status: snapshot.data!.docs[index]
                                            ['status'],
                                        names: snapshot.data!.docs[index]
                                            ['name'],
                                        phoneno: snapshot.data!.docs[index]
                                            ['phone'],
                                        email: snapshot.data!.docs[index]
                                            ['email'],
                                        address: snapshot.data!.docs[index]
                                            ['address'],
                                        location: snapshot.data!.docs[index]
                                            ['location'],
                                        uid: snapshot.data!.docs[index]['uid'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      });
              }),
        ),
      ),
    );
  }
}
