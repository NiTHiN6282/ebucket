import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/common/orders/ordersdetails.dart';
import 'package:flutter/material.dart';

import 'eordersdetails.dart';

class EOrdersList extends StatefulWidget {
  var uid;

  EOrdersList({Key? key, this.uid}) : super(key: key);

  @override
  _EOrdersListState createState() => _EOrdersListState();
}

class _EOrdersListState extends State<EOrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('eorders')
                  .where('uid', isEqualTo: widget.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no eorders found'));
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              color: Color(0xff009E60),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 100,
                            width: 200,
                            child: Center(
                              child: ListTile(
                                title:
                                Text(snapshot.data!.docs[index]['category']),
                                subtitle:
                                Text(snapshot.data!.docs[index]['price']),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EOrdersDetails(
                                        category: snapshot.data!.docs[index]
                                        ['category'],
                                        price: snapshot.data!.docs[index]
                                        ['price'],
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
