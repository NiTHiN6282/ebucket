import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EOrdersDetails extends StatefulWidget {
  dynamic category;
  dynamic price;

  EOrdersDetails({Key? key, this.price, this.category}) : super(key: key);

  @override
  _EOrdersDetailsState createState() => _EOrdersDetailsState();
}

class _EOrdersDetailsState extends State<EOrdersDetails> {
  dynamic eid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("EOrder Details"),
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
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('no eorders found'));
                } else {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.category,
                              style: GoogleFonts.lato(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                const SizedBox(
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
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
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
                                    setState(() {
                                      eid = snapshot.data!.docs[index]['eid'];
                                    });
                                    FirebaseFirestore.instance
                                        .collection('ewastes')
                                        .doc(eid)
                                        .update({
                                      'status': 1,
                                    });
                                  },
                                  icon: const Icon(Icons.remove_shopping_cart),
                                  label: const Text("Cancel Order")),
                            ),
                          ],
                        );
                      });
                }
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
