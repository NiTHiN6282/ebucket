import 'package:ebucket/admin/adminsettings.dart';
import 'package:ebucket/admin/campaign/admincampaign.dart';
import 'package:ebucket/admin/eorders/admineorderslist.dart';
import 'package:ebucket/admin/ewasterequests/ewasterequestlist.dart';
import 'package:ebucket/admin/notification/adminnotification.dart';
import 'package:ebucket/admin/orders/adminorderslist.dart';
import 'package:ebucket/admin/products/adminproducts.dart';
import 'package:ebucket/admin/viewagents/agentlist.dart';
import 'package:ebucket/admin/viewusers/userlist.dart';
import 'package:flutter/material.dart';

import '../common/loginpage.dart';

class AdminHome extends StatefulWidget {
  var status;
  var name;
  var phone;

  AdminHome({Key? key, this.status, this.name, this.phone}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Text("Admin"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminNotification()));
              },
              icon: Icon(Icons.notification_add, color: Colors.yellow)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout, color: Colors.red)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("View Users"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.group,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("View Agents"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AgentList(
                                          status: widget.status,
                                          name: widget.name,
                                          phone: widget.phone,
                                        )));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.campaign,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Campaign"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminCampaign()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.card_travel,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Products"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminProducts()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_cart,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Orders"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminOrdersList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_cart,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("EOrders"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminEOrdersList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.computer,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Ewaste Requests"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EwasteRequestList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff00adb5),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Settings"),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminSettings()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
