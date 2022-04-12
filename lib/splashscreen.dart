import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/adminhome.dart';
import 'package:ebucket/common/loginpage.dart';
import 'package:ebucket/user/userlandingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'collecting_agent/agentlandingpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((currentuser) {
      if (currentuser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        FirebaseFirestore.instance
            .collection('user')
            .doc(currentuser.uid)
            .get()
            .then((value) {
          if (value.data()!['status'] == 1 &&
              value.data()!['usertype'] == 'User') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UserLandingPage(
                          uid: value.data()!['uid'],
                          address: value.data()!['address'],
                          name: value.data()!['name'],
                          location: value.data()!['location'],
                          phone: value.data()!['phone'],
                          email: value.data()!['email'],
                          category: value.data()!['usertype'],
                        )));
          } else if (value.data()!['status'] == 1 &&
              value.data()!['usertype'] == 'Collecting Agent') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AgentLandingPage(
                          agentid: value.data()!['uid'],
                          agentname: value.data()!['name'],
                          address: value.data()!['address'],
                          name: value.data()!['name'],
                          location: value.data()!['location'],
                          phone: value.data()!['phone'],
                          email: value.data()!['email'],
                          category: value.data()!['usertype'],
                        )));
          }else if (value.data()!['status'] == 'admin') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AdminHome()));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('images/logo.png')),
    );
  }
}
