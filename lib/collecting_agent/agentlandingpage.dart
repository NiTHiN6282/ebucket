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

// ignore: must_be_immutable
class AgentLandingPage extends StatefulWidget {
  dynamic name;
  dynamic address;
  dynamic location;
  dynamic phone;
  dynamic email;
  dynamic category;
  dynamic agentid;
  dynamic agentname;

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
  dynamic _selectedIndex = 0;

  dynamic _widgetOptions;

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
      const ViewCampaigns(),
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
        title: const Text("E-Bucket"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AgentNotification()));
              },
              icon: const Icon(Icons.notifications, color: Colors.yellow)),
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
              icon: const Icon(Icons.person_outline, color: Colors.blueAccent)),
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
                    MaterialPageRoute(builder: (context) => const LoginPage()));
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
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.change_circle),
            title: const Text("Recycle Mall"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.campaign),
            title: const Text("Campaigns"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Orders"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            title: const Text("Eorders"),
            selectedColor: Colors.purple,
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
