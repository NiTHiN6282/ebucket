import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersDetails extends StatefulWidget {
  var product;
  var price;
  var url;

  OrdersDetails({Key? key, this.price, this.product, this.url})
      : super(key: key);

  @override
  _OrdersDetailsState createState() => _OrdersDetailsState();
}

class _OrdersDetailsState extends State<OrdersDetails> {
  var apid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Order Details"),
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
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no orders found'));
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
                              widget.product,
                              style: GoogleFonts.lato(
                                fontSize: 25,
                              ),
                            ),
                            widget.url == null
                                ? Image.asset(
                                    "images/logo.png",
                                    height: 100,
                                    width: 100,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: widget.url,
                                    errorWidget: (context, url, error) =>
                                        Image.asset('images/oos.png',
                                            fit: BoxFit.fitWidth),
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
                                        .collection('orders')
                                        .doc(snapshot.data!.docs[index]['oid'])
                                        .delete()
                                        .then((value) {
                                      showsnackbar('Order Cancelled');
                                      Navigator.pop(context);
                                    });
                                    setState(() {
                                      apid = snapshot.data!.docs[index]['apid'];
                                    });
                                    FirebaseFirestore.instance
                                        .collection('recycleproducts')
                                        .doc(apid)
                                        .update({
                                      'status': 1,
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
