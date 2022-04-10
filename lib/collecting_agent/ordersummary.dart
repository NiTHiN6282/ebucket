import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderSummary extends StatefulWidget {
  var eid;
  var price;
  var category;
  var quantity;

  OrderSummary({Key? key, this.eid, this.category, this.price, this.quantity})
      : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: Alignment.center),
            SizedBox(
              height: 30,
            ),
            Text(
              'Sale Placed',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Id: " + widget.eid, style: TextStyle(fontSize: 20)),
            ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.eid));
                  showsnackbar("Id Copied");
                },
                icon: Icon(Icons.copy),
                label: Text("Copy")),
            SizedBox(
              height: 30,
            ),
            Text("Product: " + widget.category, style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 30,
            ),
            Text("Price: " + widget.price, style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 30,
            ),
            Text("Quantity: " + widget.quantity,
                style: TextStyle(fontSize: 20)),
          ],
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
