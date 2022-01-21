
import 'package:ebucket/collecting_agent/ewastelist.dart';
import 'package:ebucket/common/campaigns/campaigns.dart';
import 'package:ebucket/common/recyclemall/recycleproductslist.dart';
import 'package:ebucket/common/viewprofile.dart';
import 'package:flutter/material.dart';

class AgentHome extends StatefulWidget {
  var uid;
  var name;
  var address;
  var location;
  var phone;
  var email;
  var category;
  AgentHome({Key? key,this.uid,this.name,this.address,this.location,this.phone,this.email,this.category}) : super(key: key);

  @override
  _AgentHomeState createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {

  TextEditingController nameinputcontroller = new TextEditingController();
  TextEditingController phoneinputcontroller = new TextEditingController();
  TextEditingController addressinputcontroller = new TextEditingController();
  TextEditingController locationinputcontroller = new TextEditingController();
  void initState() {
    nameinputcontroller.text=widget.category;
    locationinputcontroller.text=widget.location;
    addressinputcontroller.text=widget.address;
    phoneinputcontroller.text=widget.phone;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff00adb5),

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Buy E-Waste"),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EwasteList()));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff00adb5),

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Campaign"),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ViewCampaigns()));
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff00adb5),

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Recycle Mall"),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RecycleProductsList()));
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff00adb5),

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("View Profile"),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ViewProfile(uid: widget.uid, name: widget.name,location: widget.location,address: widget.address,phone: widget.phone,)));

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
