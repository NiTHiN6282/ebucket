import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebucket/common/buypage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RecycleProductsDetails extends StatefulWidget {
  dynamic productname;
  dynamic description;
  dynamic price;

  dynamic uid;
  dynamic name;
  dynamic address;
  dynamic location;
  dynamic phone;
  dynamic email;
  dynamic category;
  dynamic apid;
  dynamic url;

  RecycleProductsDetails(
      {Key? key,
      this.apid,
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
      this.category})
      : super(key: key);

  @override
  _RecycleProductsDetailsState createState() => _RecycleProductsDetailsState();
}

class _RecycleProductsDetailsState extends State<RecycleProductsDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
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
                          Image.asset('images/oos.png', fit: BoxFit.fitWidth),
                    ),
              const SizedBox(
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
                  const SizedBox(
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
              const SizedBox(
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
              ElevatedButton.icon(
                onPressed: () {
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
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Buy"),
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
