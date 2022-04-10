import 'package:ebucket/common/campaigns/campaigns.dart';
import 'package:ebucket/common/orders/orderslist.dart';
import 'package:ebucket/common/recyclemall/recycleproductslist.dart';
import 'package:ebucket/common/viewprofile.dart';
import 'package:ebucket/styles/colors.dart';
import 'package:ebucket/user/requests/saleslist.dart';
import 'package:ebucket/user/userhome.dart';
import 'package:ebucket/user/usernotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class UserLandingPage extends StatefulWidget {
  var uid;
  var name;
  var address;
  var location;
  var phone;
  var email;
  var category;

  UserLandingPage(
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
  _UserLandingPageState createState() => _UserLandingPageState();
}

class _UserLandingPageState extends State<UserLandingPage> {
  var _selectedIndex = 0;

  var _widgetOptions;

  void setdata() {
    _widgetOptions = <Widget>[
      UserHome(
        uid: widget.uid,
        name: widget.name,
        address: widget.address,
        location: widget.location,
        phone: widget.phone,
        email: widget.email,
        category: widget.category,
      ),
      RecycleProductsList(
        uid: widget.uid,
        name: widget.name,
        address: widget.address,
        location: widget.location,
        phone: widget.phone,
        email: widget.email,
        category: widget.category,
      ),
      ViewCampaigns(),
      OrdersList(
        uid: widget.uid,
      ),
      SalesList(
        uid: widget.uid,
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
    // TODO: implement initState
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
                        builder: (context) => UserNotification()));
              },
              icon: Icon(Icons.notifications, color: Colors.yellow)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewProfile(
                              uid: widget.uid,
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
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Ebucket'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false));
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
            icon: Icon(Icons.event_note),
            title: Text("Requests"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
