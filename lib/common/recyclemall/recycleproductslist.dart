import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/common/recyclemall/recycleproductsdetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecycleProductsList extends StatefulWidget {
  dynamic uid;
  dynamic name;
  dynamic address;
  dynamic location;
  dynamic phone;
  dynamic email;
  dynamic category;
  dynamic url;

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
                  .collection('recycleproducts')
                  .where('status', isEqualTo: 1)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('no products found'));
                } else {
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
                            child: Card(
                              elevation: 5.0,
                              child: Column(
                                children: [
                                  Container(
                                    height: 300,
                                    color: Colors.black87,
                                    child: snapshot.data!.docs[index]['url'] ==
                                            null
                                        ? Image.asset(
                                            "images/logo.png",
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: snapshot.data!.docs[index]
                                                ['url'],
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 30, top: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['productname'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Price: RS. ' +
                                                snapshot.data!.docs[index]
                                                    ['price'],
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
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
