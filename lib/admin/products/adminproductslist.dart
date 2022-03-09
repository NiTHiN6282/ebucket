import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/products/adminproductdetails.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AdminProductsList extends StatefulWidget {
  AdminProductsList({Key? key}) : super(key: key);

  @override
  _AdminProductsListState createState() => _AdminProductsListState();
}

class _AdminProductsListState extends State<AdminProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff246EE9),
        title: Text("Products List"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('recycle products')
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
                                leading: CachedNetworkImage(
                                  imageUrl: snapshot.data!.docs[index]['url'],
                                  errorWidget: (context, url, error) =>
                                      Image.asset('images/oos.png',
                                          fit: BoxFit.fitWidth),
                                ),
                                title: Text(
                                    snapshot.data!.docs[index]['productname']),
                                subtitle:
                                    Text(snapshot.data!.docs[index]['price']),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('recycle products')
                                          .doc(snapshot.data!.docs[index]
                                              ['fileName'])
                                          .delete()
                                          .then((value) {
                                        showsnackbar('Product deleted');
                                        Navigator.pop(context);
                                      });

                                      var fileName = snapshot.data!.docs[index]
                                          ['fileName'];
                                      FirebaseStorage.instance
                                          .ref()
                                          .child('products/$fileName')
                                          .delete();
                                    }),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminProductDetails(
                                        productname: snapshot.data!.docs[index]
                                            ['productname'],
                                        description: snapshot.data!.docs[index]
                                            ['description'],
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

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
