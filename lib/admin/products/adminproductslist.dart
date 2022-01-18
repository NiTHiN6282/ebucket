
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/products/adminproductdetails.dart';
import 'package:flutter/material.dart';

class AdminProductsList extends StatefulWidget {
  const AdminProductsList({Key? key}) : super(key: key);

  @override
  _AdminProductsListState createState() => _AdminProductsListState();
}

class _AdminProductsListState extends State<AdminProductsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('recycle products').where('status',isEqualTo: 1).snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasData&&snapshot.data!.docs.length==0)
              {
                return Center(child: Text('no products found'));

              }
              else
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminProductDetails(
                                productname: snapshot.data!.docs[index]['productname'],
                                description: snapshot.data!.docs[index]['description'],
                                price: snapshot.data!.docs[index]['price'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey,
                              child: Row(

                                children: [
                                  snapshot.data!.docs[index]['url'] == null
                                          ? Image.asset(
                                              "images/logo.png",
                                              height: 100,
                                              width: 100,
                                            )
                                          : Image.network(
                                              snapshot.data!.docs[index]['url'],
                                              height: 100,
                                              width: 100,
                                            ),
                                      SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Text(snapshot.data!.docs[index]['productname']),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Text(snapshot.data!.docs[index]['price']),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          ),
        ),
      ),
    );
  }
}