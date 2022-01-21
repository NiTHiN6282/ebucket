import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesDetails extends StatefulWidget {
  var category;
  var price;
  var quantity;
  SalesDetails({Key? key,this.price,this.category,this.quantity}) : super(key: key);

  @override
  _SalesDetailsState createState() => _SalesDetailsState();
}

class _SalesDetailsState extends State<SalesDetails> {

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
              stream: FirebaseFirestore.instance.collection('ewastes').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasData&&snapshot.data!.docs.length==0)
                {
                  return Center(child: Text('no sales found'));

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
                                    FirebaseFirestore.instance.collection('ewastes').doc(snapshot.data!.docs[index]['eid']).delete().then((value) {
                                      showsnackbar('Sale Cancelled');
                                      Navigator.pop(context);

                                    });
                                  },
                                  icon: Icon(Icons.remove_shopping_cart),
                                  label: Text("Cancel Sale")),
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
