import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/adminhome.dart';
import 'package:ebucket/collecting_agent/agentlandingpage.dart';
import 'package:ebucket/common/userregistration.dart';
import 'package:ebucket/user/userlandingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  var _loginkey = new GlobalKey<FormState>();
  TextEditingController emailinputcontroller = new TextEditingController();
  TextEditingController passwordinputcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _loginkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailinputcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      labelText: 'Email',
                      hintText: 'abc@gmail.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length <= 3) return 'Invalid Username';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordinputcontroller,
                    obscureText: _isHidden,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length < 4)
                        return 'Password should contain 4 characters!';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(80),
                    // ),
                    width: 150,
                    height: 40,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (_loginkey.currentState!.validate()) {
                            if (emailinputcontroller.text ==
                                    "admin" &&
                                passwordinputcontroller.text == "1234")
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminHome()));
                            else{
                              FirebaseAuth.instance.signInWithEmailAndPassword(email: emailinputcontroller.text, password: passwordinputcontroller.text).
                              then((value) => FirebaseFirestore.instance.collection('user').doc(value.user!.uid).get().
                              then((value) {
                                if(value.data()!['status']==1&&value.data()!['usertype']=='User')
                                  {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UserLandingPage(
                                              uid:value.data()!['uid'] ,
                                              address: value.data()!['address'],
                                              name: value.data()!['name'],
                                              location: value.data()!['location'],
                                              phone: value.data()!['phone'],
                                              email: value.data()!['email'],
                                              category: value.data()!['usertype'],


                                            )));
                                  }else if(value.data()!['status']==1&&value.data()!['usertype']=='Collecting Agent')
                                    {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AgentLandingPage(
                                                agentid:value.data()!['uid'] ,
                                                agentname: value.data()!['name'],
                                                address: value.data()!['address'],
                                                name: value.data()!['name'],
                                                location: value.data()!['location'],
                                                phone: value.data()!['phone'],
                                                email: value.data()!['email'],
                                                category: value.data()!['usertype'],
                                              )));
                                    }
                                else
                                  showsnackbar('Cannot login');

                              })).catchError((e)=>showsnackbar('Login failed'));
                            }


                          }
                        },
                        icon: Icon(Icons.login),
                        label: Text("Login")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          "New User? Register",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  showsnackbar(String msg){
    final snackBar = SnackBar( content: Text(msg),backgroundColor: Colors.blue,);


    ScaffoldMessenger.of(context).showSnackBar(
        snackBar
    );
  }

}
