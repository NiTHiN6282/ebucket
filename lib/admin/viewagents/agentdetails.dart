import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AgentDetails extends StatefulWidget {
  var status;
  var uid;
  var names;
  var email;
  var address;
  var phoneno;
  var location;
  AgentDetails(
      {this.names, this.email, this.address, this.phoneno, this.location,this.status,this.uid});

  @override
  _AgentDetailsState createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
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
              Text("Agent Profile",
                style: TextStyle(fontSize: 35,fontStyle: FontStyle.italic,),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.names,
                          style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Email: ",
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.email,
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        Text("Address: ",
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.address,
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Phone: ",
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.phoneno,
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Location: ",
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.location,
                          style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('user')
                                .doc(widget.uid)
                                .update({
                              'status': 1,
                            });
                            showsnackbar("Approved");

                          },
                          icon: Icon(Icons.done),
                          label: Text("Approve")),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('user')
                                .doc(widget.uid)
                                .update({
                              'status': 0,
                            });
                            showsnackbar("Rejected");

                          },
                          icon: Icon(Icons.close),
                          label: Text("Reject")),
                    ],
                  ),
                )

              )

            ],
          ),
        ),
      ),
    );
  }
  showsnackbar(String msg){
    final snackBar = SnackBar( content: Text(msg),backgroundColor: Colors.blue,);


    ScaffoldMessenger.of(context).showSnackBar(
        snackBar
    );
  }
}
