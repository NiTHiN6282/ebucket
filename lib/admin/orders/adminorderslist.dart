import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/orders/adminordersdetails.dart';
import 'package:flutter/material.dart';

class AdminOrdersList extends StatefulWidget {
  const AdminOrdersList({Key? key}) : super(key: key);

  @override
  _AdminOrdersListState createState() => _AdminOrdersListState();
}

class _AdminOrdersListState extends State<AdminOrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff246EE9),
        title: const Text("Orders"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('orders').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('no orders found'));
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
                                leading: Image.network(
                                  snapshot.data!.docs[index]['url'],
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset('images/oos.png',
                                        fit: BoxFit.fitWidth);
                                  },
                                ),
                                title:
                                    Text(snapshot.data!.docs[index]['product']),
                                subtitle:
                                    Text(snapshot.data!.docs[index]['price']),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminOrdersDetails(
                                        product: snapshot.data!.docs[index]
                                            ['product'],
                                        price: snapshot.data!.docs[index]
                                            ['price'],
                                        url: snapshot.data!.docs[index]['url'],
                                        name: snapshot.data!.docs[index]
                                            ['name'],
                                        location: snapshot.data!.docs[index]
                                            ['location'],
                                        address: snapshot.data!.docs[index]
                                            ['address'],
                                        email: snapshot.data!.docs[index]
                                            ['email'],
                                        phone: snapshot.data!.docs[index]
                                            ['phone'],
                                        apid: snapshot.data!.docs[index]
                                            ['apid'],
                                        oid: snapshot.data!.docs[index]['oid'],
                                        date: snapshot.data!.docs[index]
                                            ['date'],
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
}
