import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/common/orders/ordersdetails.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatefulWidget {
  var uid;

  OrdersList({Key? key, this.uid}) : super(key: key);

  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  .where('uid', isEqualTo: widget.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no orders found'));
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
                                      builder: (context) => OrdersDetails(
                                        product: snapshot.data!.docs[index]
                                            ['product'],
                                        price: snapshot.data!.docs[index]
                                            ['price'],
                                        url: snapshot.data!.docs[index]['url'],
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
