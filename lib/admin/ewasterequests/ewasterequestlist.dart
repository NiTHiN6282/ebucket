import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/ewasterequests/ewasterequestsdetails.dart';
import 'package:flutter/material.dart';

class EwasteRequestList extends StatefulWidget {
  EwasteRequestList({Key? key}) : super(key: key);

  @override
  _EwasteRequestListState createState() => _EwasteRequestListState();
}

class _EwasteRequestListState extends State<EwasteRequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff246EE9),
        title: Text("Requests"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('ewastes').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no requests found'));
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff009E60),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 100,
                            width: 200,
                            child: Center(
                              child: ListTile(
                                leading: Text((index + 1).toString()),
                                title: Text(
                                    snapshot.data!.docs[index]['category']),
                                subtitle: Text(snapshot.data!.docs[index]
                                        ['quantity'] +
                                    'KG'),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('ewastes')
                                          .doc(
                                              snapshot.data!.docs[index]['eid'])
                                          .delete()
                                          .then((value) {
                                        showsnackbar('Request Cancelled');
                                        Navigator.pop(context);
                                      });
                                    }),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EwasteRequestsDetails(
                                        category: snapshot.data!.docs[index]
                                            ['category'],
                                        quantity: snapshot.data!.docs[index]
                                            ['quantity'],
                                        price: snapshot.data!.docs[index]
                                            ['price'],
                                        name: snapshot.data!.docs[index]
                                            ['name'],
                                        location: snapshot.data!.docs[index]
                                            ['location'],
                                        address: snapshot.data!.docs[index]
                                            ['address'],
                                        phone: snapshot.data!.docs[index]
                                            ['phone'],
                                        eid: snapshot.data!.docs[index]['eid'],
                                        date: snapshot.data!.docs[index]
                                            ['date'],
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

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
