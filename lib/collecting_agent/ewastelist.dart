import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/collecting_agent/ewastelistdetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ewastelistdetails.dart';

class EwasteList extends StatefulWidget {
  var agentid;
  var agentname;

  EwasteList({Key? key, this.agentid, this.agentname}) : super(key: key);

  @override
  _EwasteListState createState() => _EwasteListState();
}

class _EwasteListState extends State<EwasteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('ewastes').where('status', isEqualTo: 1).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no ewaste found'));
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EwasteListDetails(
                                    eid: snapshot.data!.docs[index]['eid'],
                                    name: snapshot.data!.docs[index]['name'],
                                    uid: snapshot.data!.docs[index]['uid'],
                                    phone: snapshot.data!.docs[index]['phone'],
                                    location: snapshot.data!.docs[index]
                                        ['location'],
                                    quantity: snapshot.data!.docs[index]
                                        ['quantity'],
                                    category: snapshot.data!.docs[index]
                                        ['category'],
                                    price: snapshot.data!.docs[index]['price'],
                                    agentid: widget.agentid,
                                    agentname: widget.agentname,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Product: ' +
                                                  snapshot.data!.docs[index]
                                                      ['category'],
                                              style: GoogleFonts.lato(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Location: ' +
                                                  snapshot.data!.docs[index]
                                                      ['location'],
                                              style: GoogleFonts.lato(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Quantity: ' +
                                                  snapshot.data!.docs[index]
                                                      ['quantity'],
                                              style: GoogleFonts.lato(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
              }),
        ),
      ),
    );
  }
}
