import 'package:flutter/material.dart';

class EwasteListDetails extends StatefulWidget {
  var category;
  var name;
  var phone;
  var quantity;
  var location;
  var price;
  var agentprice;
  var agentname;

  EwasteListDetails(
      {this.name,
      this.phone,
      this.quantity,
      this.location,
      this.category,
      this.price,
      this.agentprice,
      this.agentname});

  @override
  _EwasteListDetailsState createState() => _EwasteListDetailsState();
}

class _EwasteListDetailsState extends State<EwasteListDetails> {
  TextEditingController auctionpriceinputcontroller = new TextEditingController();
  List agentname = ['Nithin', 'Devika bts', 'Vyshnav cp', 'binya mp'];
  List agentprice = ['122', '244', '388', '5000'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showalert();
        },
        child: Icon(
          Icons.add,
          size: 40,
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
              Text("Ewaste Details"),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: agentname.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
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
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.grey,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/logo.png",
                                      height: 100,
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Text(agentname[index - 1]),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Text(agentprice[index - 1]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
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
            title: Text("Auction"),
            content: Column(
              children: [
                TextFormField(
                  controller: auctionpriceinputcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Auction Price',
                    prefixIcon: Icon(Icons.money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(child: Text("Confirm"), onPressed: () {

              })
            ]);
      },
    );
  }
}
