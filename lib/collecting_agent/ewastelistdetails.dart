import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EwasteListDetails extends StatefulWidget {
  var category;
  var uid;
  var name;
  var phone;
  var quantity;
  var location;
  var price;
  var agentid;
  var agentname;
  var eid;

  EwasteListDetails({
    this.name,
    this.phone,
    this.quantity,
    this.location,
    this.category,
    this.uid,
    this.agentname,
    this.agentid,
    this.price,
    this.eid,
  });

  @override
  _EwasteListDetailsState createState() => _EwasteListDetailsState();
}

class _EwasteListDetailsState extends State<EwasteListDetails> {
  // var estatus=true;
  var aid;
  var status;
  var oldaid;
  var _auctionkey = new GlobalKey<FormState>();
  TextEditingController auctionpriceinputcontroller =
      new TextEditingController();
  // var snapshot;
  var documents;
  @override
  void initState() {
    aid = DateTime.now().toString();
    // TODO: implement initState
    super.initState();
    // snapshot=FirebaseFirestore.instance.collection('auctions').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            showalert();
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Details"),
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
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Seller Name: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.name),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text("Seller Phone: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.phone),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text("Location: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.location),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text("Product Name: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.category),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text("Quantity: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.quantity),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text("Price: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.price),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          });
                    }),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('auctions').where('eid', isEqualTo: widget.eid)
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
                                    // color: Colors.red,
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
                                      subtitle: Text(snapshot.data!.docs[index]
                                          ['agentprice']),
                                      trailing: IconButton(
                                          icon: snapshot.data!.docs[index]['agentid']==widget.agentid ? Icon(Icons.edit, color: Colors.blue) : Icon(Icons.call, color: Color(0xff009e60)),
                                          onPressed: () {
                                            if (snapshot.data!.docs[index]
                                            ['status'] !=
                                                0 &&
                                                snapshot.data!.docs[index]
                                                ['agentid'] ==
                                                    widget.agentid) {
                                              oldaid=snapshot.data!.docs[index]['aid'];
                                              showalertupdate();
                                            }
                                          }),
                                      onTap: () {
                                        if (snapshot.data!.docs[index]
                                                    ['status'] !=
                                                0 &&
                                            snapshot.data!.docs[index]
                                                    ['agentid'] ==
                                                widget.agentid) {
                                          oldaid=snapshot.data!.docs[index]['aid'];
                                          showalertupdate();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showalert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Auction"),
          content: Column(children: [
            Form(
              key: _auctionkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: auctionpriceinputcontroller,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          prefixIcon: Icon(Icons.category),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(80),
                        // ),
                        width: 150,
                        height: 40,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              if (_auctionkey.currentState!.validate()) {
                                FirebaseFirestore.instance
                                    .collection('auctions')
                                    .doc(aid)
                                    .set({
                                  'eid' : widget.eid,
                                  'aid': aid,
                                  'agentprice':
                                      auctionpriceinputcontroller.text,
                                  'agentid': widget.agentid,
                                  'agentname': widget.agentname,
                                  'status': 1,
                                  'date': DateTime.now().toString()
                                }).then((value) {
                                  showsnackbar('Auction Submitted');
                                  Navigator.pop(context);
                                });
                              }
                            },
                            icon: Icon(Icons.done),
                            label: Text("submit")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        );
      },
    );
  }

  showalertupdate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Auction"),
          content: Column(children: [
            Form(
              key: _auctionkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: auctionpriceinputcontroller,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          prefixIcon: Icon(Icons.category),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              if (_auctionkey.currentState!.validate()) {
                                FirebaseFirestore.instance
                                    .collection('auctions')
                                    .doc(oldaid)
                                    .update({
                                  'agentprice':
                                      auctionpriceinputcontroller.text,
                                }).then((value) {
                                  showsnackbar('Auction Updated');
                                  Navigator.pop(context);
                                });
                              }
                            },
                            icon: Icon(Icons.done),
                            label: Text("submit")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        );
      },
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
