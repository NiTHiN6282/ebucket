import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EOrdersDetails extends StatefulWidget {
  var category;
  var price;

  EOrdersDetails({Key? key, this.price, this.category})
      : super(key: key);

  @override
  _EOrdersDetailsState createState() => _EOrdersDetailsState();
}

class _EOrdersDetailsState extends State<EOrdersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("EOrder Details"),
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
                  return Center(child: Text('no eorders found'));
                } else
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.category,
                              style: GoogleFonts.lato(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Price: ' + widget.price + 'Rs',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 150,
                              height: 50,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(50),
                              //       color: Colors.green,
                              // ),

                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('eorders')
                                        .doc(snapshot.data!.docs[index]['eoid'])
                                        .delete()
                                        .then((value) {
                                      showsnackbar('Order Cancelled');
                                      Navigator.pop(context);
                                    });
                                  },
                                  icon: Icon(Icons.remove_shopping_cart),
                                  label: Text("Cancel Order")),
                            ),
                          ],
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
