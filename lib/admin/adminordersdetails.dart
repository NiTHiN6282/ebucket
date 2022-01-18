import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminOrdersDetails extends StatefulWidget {
  var product;
  var price;
  var url;
  var name;
  var location;
  var address;
  var phone;
  var email;
  var date;
  var oid;
  var apid;

  AdminOrdersDetails({Key? key,this.price,this.product,this.url,this.name,this.location,this.address,this.phone,this.email,this.apid,this.date,this.oid}) : super(key: key);

  @override
  _AdminOrdersDetailsState createState() => _AdminOrdersDetailsState();
}

class _AdminOrdersDetailsState extends State<AdminOrdersDetails> {

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
              stream: FirebaseFirestore.instance.collection('orders').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasData&&snapshot.data!.docs.length==0)
                {
                  return Center(child: Text('no orders found'));

                }
                else
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(widget.product,
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
                                : Image.network(
                                widget.url
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Price: '+widget.price+'Rs',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('User: '+widget.name,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Location: '+widget.location,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Address: '+widget.address,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Email: '+widget.email,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Phone: '+widget.phone,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     Text('apid: '+widget.apid,
                            //       style: GoogleFonts.lato(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 40,
                            // ),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     Text('oid: '+widget.oid,
                            //       style: GoogleFonts.lato(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 40,
                            // ),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     Text('Date of order: '+widget.date,
                            //       style: GoogleFonts.lato(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Container(
                              width: 150,
                              height: 50,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(50),
                              //       color: Colors.green,
                              // ),

                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection('orders').doc(snapshot.data!.docs[index]['oid']).delete().then((value) {
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
              }
          ),
        ),
      ),
    );
  }
  showsnackbar(String msg){
    final snackBar = SnackBar( content: Text(msg),backgroundColor: Colors.blue,);


    ScaffoldMessenger.of(context).showSnackBar(
        snackBar
    );
  }
}
