import 'package:flutter/material.dart';

class AdminProductDetails extends StatefulWidget {
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

  AdminProductDetails(
      {this.productname,
      this.description,
      this.price,
      this.uid,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email,
      this.category});

  @override
  _AdminProductDetailsState createState() => _AdminProductDetailsState();
}

class _AdminProductDetailsState extends State<AdminProductDetails> {
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
              Text("Product Details"),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Product Name: "),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.productname),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Description: "),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.description),
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
            ],
          ),
        ),
      ),
    );
  }
}
