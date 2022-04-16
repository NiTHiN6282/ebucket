import 'package:ebucket/common/loginpage.dart';
import 'package:flutter/material.dart';

class AdminSettings extends StatefulWidget {
  const AdminSettings({Key? key}) : super(key: key);

  @override
  _AdminSettingState createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Text("Logout"),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
