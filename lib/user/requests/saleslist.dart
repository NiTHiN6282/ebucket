
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/user/requests/salesdetails.dart';
import 'package:flutter/material.dart';

class SalesList extends StatefulWidget {
  var uid;
  SalesList({Key? key,this.uid}) : super(key: key);

  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('ewastes').where('uid', isEqualTo: widget.uid).snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasData&&snapshot.data!.docs.length==0)
                {
                  return Center(child: Text('no requests found'));

                }
                else
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
                                leading: Text((index + 1).toString()),
                                title: Text(snapshot.data!.docs[index]['category']),
                                subtitle: Text(snapshot.data!.docs[index]['quantity']+'KG'),

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SalesDetails(
                                        category: snapshot.data!.docs[index]['category'],
                                        quantity: snapshot.data!.docs[index]['quantity'],
                                        price: snapshot.data!.docs[index]['price'],
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
          ),
        ),
      ),

    );
  }
}
