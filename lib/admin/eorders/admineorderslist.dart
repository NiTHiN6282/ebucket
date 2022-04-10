import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'admineordersdetails.dart';

class AdminEOrdersList extends StatefulWidget {
  AdminEOrdersList({Key? key}) : super(key: key);

  @override
  _AdminEOrdersListState createState() => _AdminEOrdersListState();
}

class _AdminEOrdersListState extends State<AdminEOrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff246EE9),
        title: Text("EOrders"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('eorders').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no Eorders found'));
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
                                subtitle:
                                    Text(snapshot.data!.docs[index]['price']),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminEOrdersDetails(
                                        category: snapshot.data!.docs[index]
                                            ['category'],
                                        price: snapshot.data!.docs[index]
                                            ['price'],
                                        agentid: snapshot.data!.docs[index]
                                            ['agentid'],
                                        eid: snapshot.data!.docs[index]['eid'],
                                        eoid: snapshot.data!.docs[index]
                                            ['eoid'],
                                        uid: snapshot.data!.docs[index]['uid'],
                                        date: snapshot.data!.docs[index]
                                            ['date'],
                                        quantity: snapshot.data!.docs[index]
                                            ['quantity'],
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
