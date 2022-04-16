import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserDetails extends StatefulWidget {
  dynamic names;
  dynamic email;
  dynamic address;
  dynamic phoneno;
  dynamic location;

  UserDetails(
      {Key? key,
      this.names,
      this.email,
      this.address,
      this.phoneno,
      this.location})
      : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
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
              const Text("User Profile"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Name: "),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.names),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Address: "),
                  const SizedBox(
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
