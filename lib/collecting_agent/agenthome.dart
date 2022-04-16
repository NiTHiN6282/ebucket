import 'package:ebucket/collecting_agent/ewastelist.dart';
import 'package:ebucket/common/campaigns/campaigns.dart';
import 'package:ebucket/common/recyclemall/recycleproductslist.dart';
import 'package:ebucket/common/viewprofile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgentHome extends StatefulWidget {
  dynamic uid;
  dynamic name;
  dynamic address;
  dynamic location;
  dynamic phone;
  dynamic email;
  dynamic category;

  AgentHome(
      {Key? key,
      this.uid,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email,
      this.category})
      : super(key: key);

  @override
  _AgentHomeState createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  TextEditingController nameinputcontroller = TextEditingController();
  TextEditingController phoneinputcontroller = TextEditingController();
  TextEditingController addressinputcontroller = TextEditingController();
  TextEditingController locationinputcontroller = TextEditingController();

  @override
  void initState() {
    nameinputcontroller.text = widget.category;
    locationinputcontroller.text = widget.location;
    addressinputcontroller.text = widget.address;
    phoneinputcontroller.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff00adb5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Buy E-Waste"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EwasteList()));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff00adb5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Campaign"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewCampaigns()));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff00adb5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Recycle Mall"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecycleProductsList()));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff00adb5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("View Profile"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewProfile(
                                    uid: widget.uid,
                                    name: widget.name,
                                    location: widget.location,
                                    address: widget.address,
                                    phone: widget.phone,
                                  )));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
