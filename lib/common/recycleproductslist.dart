import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/common/recycleproductsdetails.dart';
import 'package:flutter/material.dart';

class RecycleProductsList extends StatefulWidget {
  var uid;
  var name;
  var address;
  var location;
  var phone;
  var email;
  var category;
  var url;

  RecycleProductsList(
      {Key? key,
      this.uid,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.url,
      this.email,
      this.category})
      : super(key: key);

  @override
  _RecycleProductsListState createState() => _RecycleProductsListState();
}

class _RecycleProductsListState extends State<RecycleProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('recycle products')
                  .where('status', isEqualTo: 1)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no products found'));
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecycleProductsDetails(
                                    productname: snapshot.data!.docs[index]
                                        ['productname'],
                                    description: snapshot.data!.docs[index]
                                        ['description'],
                                    price: snapshot.data!.docs[index]['price'],
                                    apid: snapshot.data!.docs[index]['apid'],
                                    url: snapshot.data!.docs[index]['url'],
                                    uid: widget.uid,
                                    name: widget.name,
                                    address: widget.address,
                                    location: widget.location,
                                    email: widget.email,
                                    phone: widget.phone,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      snapshot.data!.docs[index]['url'] == null
                                          ? Image.asset(
                                              "images/logo.png",
                                              height: 100,
                                              width: 100,
                                            )
                                          : Image.network(
                                              snapshot.data!.docs[index]['url'],
                                            ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]
                                            ['productname'],
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Price: ' +
                                            snapshot.data!.docs[index]['price'],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
