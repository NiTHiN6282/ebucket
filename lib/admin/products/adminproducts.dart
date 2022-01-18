import 'package:ebucket/admin/products/adminaddproducts.dart';
import 'package:ebucket/admin/products/adminproductslist.dart';
import 'package:ebucket/common/loginpage.dart';
import 'package:flutter/material.dart';

class AdminProducts extends StatefulWidget {
  const AdminProducts({Key? key}) : super(key: key);

  @override
  _AdminProductsState createState() => _AdminProductsState();
}

class _AdminProductsState extends State<AdminProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff246EE9),
        title: Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout, color: Colors.black)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffFF4060),
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
                        child: Text("View Products"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminProductsList()));
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
                    // color: Colors.red,
                    color: Color(0xffFF4060),
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
                        child: Text("Add Products"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminAddProducts()));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
