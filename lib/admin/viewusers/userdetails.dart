import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  var names;
  var email;
  var address;
  var phoneno;
  var location;
  UserDetails(
      {this.names, this.email, this.address, this.phoneno, this.location});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
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
              Text("User Profile"),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Name: "),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.names),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Address: "),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.address),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
