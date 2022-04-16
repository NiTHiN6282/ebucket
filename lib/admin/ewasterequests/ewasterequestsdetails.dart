import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EwasteRequestsDetails extends StatefulWidget {
  dynamic category;
  dynamic price;
  dynamic quantity;
  dynamic name;
  dynamic location;
  dynamic address;
  dynamic phone;
  dynamic date;
  dynamic eid;
  dynamic uid;

  EwasteRequestsDetails(
      {Key? key,
      this.price,
      this.category,
      this.quantity,
      this.name,
      this.location,
      this.address,
      this.phone,
      this.eid,
      this.date,
      this.uid})
      : super(key: key);

  @override
  _EwasteRequestsDetailsState createState() => _EwasteRequestsDetailsState();
}

class _EwasteRequestsDetailsState extends State<EwasteRequestsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('ewastes').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('no orders found'));
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
                              height: 40,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Quantity: ' + widget.quantity + 'KG',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  'User: ' + widget.name,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  'Location: ' + widget.location,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  'Address: ' + widget.address,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  'Date: ' + widget.date,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  'Phone: ' + widget.phone,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
                                  'eid: ' + widget.eid,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    'Date of order: ' + widget.date,
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                    ),
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
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('ewastes')
                                        .doc(snapshot.data!.docs[index]['eid'])
                                        .delete()
                                        .then((value) {
                                      showsnackbar('Request Cancelled');
                                      Navigator.pop(context);
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
