import 'package:ebucket/common/loginpage.dart';
import 'package:ebucket/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Bucket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/login': (BuildContext context) => const LoginPage()},
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
