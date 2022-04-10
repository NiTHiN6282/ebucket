import 'package:ebucket/collecting_agent/agentnotification.dart';
import 'package:ebucket/collecting_agent/ewastelist.dart';
import 'package:ebucket/common/campaigns/campaigns.dart';
import 'package:ebucket/common/loginpage.dart';
import 'package:ebucket/common/orders/orderslist.dart';
import 'package:ebucket/common/recyclemall/recycleproductslist.dart';
import 'package:ebucket/common/viewprofile.dart';
import 'package:ebucket/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../common/orders/eorderslist.dart';

class AgentLandingPage extends StatefulWidget {
  var name;
  var address;
  var location;
  var phone;
  var email;
  var category;
  var agentid;
  var agentname;

  AgentLandingPage(
      {Key? key,
      this.agentid,
      this.agentname,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email,
      this.category})
      : super(key: key);

  @override
  _AgentLandingPageState createState() => _AgentLandingPageState();
}

class _AgentLandingPageState extends State<AgentLandingPage> {
  var _selectedIndex = 0;

  var _widgetOptions;

  void setdata() {
    _widgetOptions = <Widget>[
      EwasteList(
        agentid: widget.agentid,
        agentname: widget.agentname,
      ),
      RecycleProductsList(
        uid: widget.agentid,
        name: widget.name,
        address: widget.address,
        location: widget.location,
        phone: widget.phone,
        email: widget.email,
        category: widget.category,
      ),
      ViewCampaigns(),
      OrdersList(
        uid: widget.agentid,
      ),
      EOrdersList(
        uid: widget.agentid,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text("E-Bucket"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgentNotification()));
              },
              icon: Icon(Icons.notifications, color: Colors.yellow)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewProfile(
                              uid: widget.agentid,
                              name: widget.name,
                              address: widget.address,
                              location: widget.location,
                              phone: widget.phone,
                              email: widget.email,
                              category: widget.category,
                            )));
              },
              icon: Icon(Icons.person_outline, color: Colors.blueAccent)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Ebucket'),
            ),
            ListTile(
              title: const Text('Terms & Conditions'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.change_circle),
            title: Text("Recycle Mall"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.campaign),
            title: Text("Campaigns"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Orders"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Eorders"),
            selectedColor: Colors.purple,
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
