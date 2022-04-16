import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminProductDetails extends StatefulWidget {
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

  AdminProductDetails(
      {Key? key,
      this.productname,
      this.description,
      this.price,
      this.uid,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email,
      this.category})
      : super(key: key);

  @override
  _AdminProductDetailsState createState() => _AdminProductDetailsState();
}

class _AdminProductDetailsState extends State<AdminProductDetails> {
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
              const Text("Product Details"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Product Name: "),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.productname),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Description: "),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.description),
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
            ],
          ),
        ),
      ),
    );
  }
}
