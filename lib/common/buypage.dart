import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BuyPage extends StatefulWidget {
  dynamic uid;
  dynamic name;
  dynamic address;
  dynamic location;
  dynamic phone;
  dynamic email;
  dynamic category;
  dynamic apid;
  dynamic productname;
  dynamic price;
  dynamic url;

  BuyPage(
      {Key? key,
      this.uid,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email,
      this.url,
      this.apid,
      this.productname,
      this.price,
      this.category})
      : super(key: key);

  @override
  BuyPageState createState() => BuyPageState();
}

class BuyPageState extends State<BuyPage> with SingleTickerProviderStateMixin {
  dynamic oid;
  dynamic apid;
  TextEditingController nameinputcontroller = TextEditingController();
  TextEditingController locationinputcontroller = TextEditingController();
  TextEditingController phoneinputcontroller = TextEditingController();
  TextEditingController addressinputcontroller = TextEditingController();
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    nameinputcontroller.text = widget.name;
    locationinputcontroller.text = widget.location;
    phoneinputcontroller.text = widget.phone;
    addressinputcontroller.text = widget.address;
    oid = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Campaigns"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  child: Text('Order Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'sans-serif-light',
                                          color: Colors.black)),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xffFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Product Name: ",
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.productname,
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Price: ",
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.price,
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      controller: nameinputcontroller,
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Name",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Location',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      controller: locationinputcontroller,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Location"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      controller: phoneinputcontroller,
                                      keyboardType: TextInputType.phone,
                                      maxLength: 10,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Mobile Number"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Address',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: TextFormField(
                                        controller: addressinputcontroller,
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        decoration: const InputDecoration(
                                            hintText: "Address"),
                                        enabled: !_status,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          !_status ? _getActionButtons() : Container(),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('recycleproducts')
                          .doc(widget.apid)
                          .update({
                        'status': 0,
                      });
                      FirebaseFirestore.instance
                          .collection('orders')
                          .doc(oid)
                          .set({
                        'oid': oid,
                        'apid': widget.apid,
                        'uid': widget.uid,
                        'name': widget.name,
                        'product': widget.productname,
                        'price': widget.price,
                        'location': widget.location,
                        'address': widget.address,
                        'phone': widget.phone,
                        'email': widget.email,
                        'status': 1,
                        'url': widget.url,
                        'date': DateTime.now()
                      }).then((value) {
                        showsnackbar('Order Placed');
                        Navigator.pop(context);
                      });
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Place Order"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                child: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.name = nameinputcontroller.text;
                    widget.location = locationinputcontroller.text;
                    widget.phone = phoneinputcontroller.text;
                    widget.address = addressinputcontroller.text;
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ElevatedButton(
                child: const Text("Cancel"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
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
