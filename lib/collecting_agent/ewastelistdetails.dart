import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EwasteListDetails extends StatefulWidget {
  dynamic category;
  dynamic uid;
  dynamic name;
  dynamic phone;
  dynamic quantity;
  dynamic location;
  dynamic price;
  dynamic agentid;
  dynamic agentname;
  dynamic eid;

  EwasteListDetails({
    Key? key,
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
  }) : super(key: key);

  @override
  _EwasteListDetailsState createState() => _EwasteListDetailsState();
}

class _EwasteListDetailsState extends State<EwasteListDetails> {
  dynamic aid;
  dynamic status;
  dynamic auctioncheck;
  dynamic oldaid;
  final _auctionkey = GlobalKey<FormState>();
  TextEditingController auctionpriceinputcontroller = TextEditingController();

  dynamic documents;

  @override
  void initState() {
    aid = DateTime.now().toString();
    super.initState();
    FirebaseFirestore.instance
        .collection('ewastes')
        .doc(widget.eid)
        .get()
        .then((value) {
      if (value.data()![widget.agentid] != null) {
        auctioncheck = true;
      }
      oldaid = value.data()![widget.agentid];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            if (auctioncheck == true) {
              showalertupdate();
            } else {
              showalert();
            }
          },
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Details"),
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
                                    const Text("Seller Name: "),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.name),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text("Seller Phone: "),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.phone),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text("Location: "),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.location),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text("Product Name: "),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.category),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text("Quantity: "),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.quantity),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text("Price: "),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.price),
                                  ],
                                ),
                                const SizedBox(
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
                        .collection('auctions')
                        .where('eid', isEqualTo: widget.eid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData &&
                          snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('no auctions found'));
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff009e60),
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
                                          icon: snapshot.data!.docs[index]
                                                      ['agentid'] ==
                                                  widget.agentid
                                              ? const Icon(Icons.edit,
                                                  color: Colors.blue)
                                              : const Icon(Icons.call,
                                                  color: Color(0xff009e60)),
                                          onPressed: () {
                                            if (snapshot.data!.docs[index]
                                                        ['status'] !=
                                                    0 &&
                                                snapshot.data!.docs[index]
                                                        ['agentid'] ==
                                                    widget.agentid) {
                                              oldaid = snapshot
                                                  .data!.docs[index]['aid'];
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
                                          oldaid =
                                              snapshot.data!.docs[index]['aid'];
                                          showalertupdate();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
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
          title: const Text("Auction"),
          content: Column(children: [
            Form(
              key: _auctionkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: auctionpriceinputcontroller,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          prefixIcon: const Icon(Icons.category),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              if (_auctionkey.currentState!.validate()) {
                                FirebaseFirestore.instance
                                    .collection('auctions')
                                    .doc(aid)
                                    .set({
                                  'eid': widget.eid,
                                  'aid': aid,
                                  'agentprice':
                                      auctionpriceinputcontroller.text,
                                  'agentid': widget.agentid,
                                  'agentname': widget.agentname,
                                  'status': 1,
                                  'date': DateTime.now().toString()
                                }).then((value) {
                                  showsnackbar('Auction Submitted');
                                  FirebaseFirestore.instance
                                      .collection('ewastes')
                                      .doc(widget.eid)
                                      .update({
                                    widget.agentid: aid,
                                  });
                                  Navigator.pop(context);
                                });
                              }
                            },
                            icon: const Icon(Icons.done),
                            label: const Text("submit")),
                      ),
                      const SizedBox(
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
          title: const Text("Auction"),
          content: Column(children: [
            Form(
              key: _auctionkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: auctionpriceinputcontroller,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          prefixIcon: const Icon(Icons.category),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
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
                            icon: const Icon(Icons.done),
                            label: const Text("submit")),
                      ),
                      const SizedBox(
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
