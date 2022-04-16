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
        backgroundColor: const Color(0xff246EE9),
        title: const Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout, color: Colors.black)),
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
                    color: const Color(0xffFF4060),
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
                        child: Text("View Products"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminProductsList()));
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
                    color: const Color(0xffFF4060),
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
                        child: Text("Add Products"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminAddProducts()));
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
