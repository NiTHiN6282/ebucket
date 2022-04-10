import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesDetails extends StatefulWidget {
  var category;
  var price;
  var quantity;
  var eid;
  var uid;

  SalesDetails(
      {Key? key, this.price, this.category, this.quantity, this.eid, this.uid})
      : super(key: key);

  @override
  _SalesDetailsState createState() => _SalesDetailsState();
}

class _SalesDetailsState extends State<SalesDetails> {
  var oid;
  var agentid;

  @override
  void initState() {
    oid = DateTime.now().toString();
    super.initState();
  }

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
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ewastes')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData &&
                            snapshot.data!.docs.length == 0) {
                          return Center(child: Text('no sales found'));
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
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: ElevatedButton.icon(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('ewastes')
                                                .doc(snapshot.data!.docs[index]
                                                    ['eid'])
                                                .delete()
                                                .then((value) {
                                              showsnackbar('Sale Cancelled');
                                              Navigator.pop(context);
                                            });
                                          },
                                          icon:
                                              Icon(Icons.remove_shopping_cart),
                                          label: Text("Cancel Sale")),
                                    ),
                                  ],
                                );
                              });
                      }),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('auctions')
                          .where('eid', isEqualTo: widget.eid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData &&
                            snapshot.data!.docs.length == 0) {
                          return Center(child: Text('no auctions found'));
                        } else
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff009e60),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 100,
                                    width: 200,
                                    child: Center(
                                      child: ListTile(
                                        leading: Text((index + 1).toString()),
                                        title: Text(snapshot.data!.docs[index]
                                            ['agentname']),
                                        subtitle: Text(snapshot
                                            .data!.docs[index]['agentprice']),
                                        trailing: IconButton(
                                            icon: Icon(Icons.done,
                                                color: Colors.blue),
                                            onPressed: () {
                                              setState(() {
                                                agentid = snapshot.data!
                                                    .docs[index]['agentid'];
                                              });
                                              FirebaseFirestore.instance
                                                  .collection('ewastes')
                                                  .doc(widget.eid)
                                                  .update({
                                                'status': 0,
                                              }).then((value) => {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'eorders')
                                                            .doc(oid)
                                                            .set({
                                                          'eoid': oid,
                                                          'category':
                                                              widget.category,
                                                          'quantity':
                                                              widget.quantity,
                                                          'price': widget.price,
                                                          'eid': widget.eid,
                                                          'uid': agentid,
                                                          'agentid': agentid,
                                                          'date': DateTime.now()
                                                        }).then((value) {
                                                          showsnackbar(
                                                              'Order Submitted');
                                                          Navigator.pop(
                                                              context);
                                                        })
                                                      });
                                            }),
                                      ),
                                    ),
                                  ),
                                );
                              });
                      }),
                ),
              ],
            )),
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
