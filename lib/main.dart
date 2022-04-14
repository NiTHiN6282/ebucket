import 'package:ebucket/common/loginpage.dart';
import 'package:ebucket/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Bucket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/login': (BuildContext context) => LoginPage()},
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
