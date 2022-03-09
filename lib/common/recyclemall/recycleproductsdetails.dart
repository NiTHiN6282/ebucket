import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebucket/common/buypage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecycleProductsDetails extends StatefulWidget {
  var productname;
  var description;
  var price;

  var uid;
  var name;
  var address;
  var location;
  var phone;
  var email;
  var category;
  var apid;
  var url;

  RecycleProductsDetails(
      {this.apid,
      this.productname,
      this.description,
      this.price,
      this.uid,
      this.url,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email,
      this.category});

  @override
  _RecycleProductsDetailsState createState() => _RecycleProductsDetailsState();
}

class _RecycleProductsDetailsState extends State<RecycleProductsDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Product Details",
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
                  : CachedNetworkImage(
                imageUrl: widget.url,
                errorWidget: (context, url, error) =>
                    Image.asset('images/oos.png',
                        fit: BoxFit.fitWidth),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Product Name: ",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Description: ",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.description,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Price: ",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
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
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // FirebaseFirestore.instance
                    //     .collection('sales')
                    //     .doc(sid)
                    //     .set({
                    //   'sid': sid,
                    //   'apid': widget.apid,
                    //   'uid': widget.uid,
                    //   'name': widget.name,
                    //   'product': widget.productname,
                    //   'price': widget.price,
                    //   'status': 1,
                    //   'date': DateTime.now()
                    // }).then((value) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => BuyPage(uid: widget.uid,name: widget.name,phone: widget.phone,address: widget.address,location: widget.location,email: widget.email,productname: widget.productname,price: widget.price,)));
                    // });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyPage(
                                  apid: widget.apid,
                                  uid: widget.uid,
                                  name: widget.name,
                                  phone: widget.phone,
                                  address: widget.address,
                                  location: widget.location,
                                  email: widget.email,
                                  productname: widget.productname,
                                  price: widget.price,
                                  url: widget.url,
                                )));
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Buy"),
                ),
              ),
            ],
          ),
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
