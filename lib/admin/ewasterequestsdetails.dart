import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EwasteRequestsDetails extends StatefulWidget {
  var category;
  var price;
  var quantity;
  var name;
  var location;
  var address;
  var phone;
  var date;
  var eid;
  var uid;

  EwasteRequestsDetails({Key? key,this.price,this.category,this.quantity,this.name,this.location,this.address,this.phone,this.eid,this.date,this.uid}) : super(key: key);

  @override
  _EwasteRequestsDetailsState createState() => _EwasteRequestsDetailsState();
}

class _EwasteRequestsDetailsState extends State<EwasteRequestsDetails> {

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
                            Text(widget.category,
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
                                Text('Quantity: '+widget.quantity+'KG',
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
                                Text('Date: '+widget.date,
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
