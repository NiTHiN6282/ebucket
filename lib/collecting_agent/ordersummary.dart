import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class OrderSummary extends StatefulWidget {
  dynamic eid;
  dynamic price;
  dynamic category;
  dynamic quantity;

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
            const Align(alignment: Alignment.center),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Sale Placed',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("Id: " + widget.eid, style: const TextStyle(fontSize: 20)),
            ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.eid));
                  showsnackbar("Id Copied");
                },
                icon: const Icon(Icons.copy),
                label: const Text("Copy")),
            const SizedBox(
              height: 30,
            ),
            Text("Product: " + widget.category,
                style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 30,
            ),
            Text("Price: " + widget.price,
                style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 30,
            ),
            Text("Quantity: " + widget.quantity,
                style: const TextStyle(fontSize: 20)),
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
