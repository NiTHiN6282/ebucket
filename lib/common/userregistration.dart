import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var category;
  var _loginkey = new GlobalKey<FormState>();
  TextEditingController nameinputcontroller = new TextEditingController();
  TextEditingController addressinputcontroller = new TextEditingController();
  TextEditingController phoneinputcontroller = new TextEditingController();
  TextEditingController emailinputcontroller = new TextEditingController();
  TextEditingController passwordinputcontroller = new TextEditingController();
  TextEditingController locationinputcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                    controller: nameinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length <= 3) return 'Invalid Name';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: locationinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phoneinputcontroller,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Phone no.',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length != 10)
                        return 'Number should contain 10 characters!';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailinputcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: category,
                    decoration: InputDecoration(
                      hintText: "Category",

                      prefixIcon: Icon(Icons.email),
                      //suffixIcon: Icon(Icons.panorama_fish_eye),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (ctgry) => setState(() => category = ctgry),
                    validator: (value) =>
                        value == null ? 'field required' : null,
                    items: ['User', 'Collecting Agent']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordinputcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length < 8)
                        return 'Number should contain 8 characters!';
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
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailinputcontroller.text, password: passwordinputcontroller.text).
                            then((value) => FirebaseFirestore.instance.collection('user').doc(value.user!.uid).
                            set({
                              'uid':value.user!.uid,
                              'name':nameinputcontroller.text,
                              'address':addressinputcontroller.text,
                              'location':locationinputcontroller.text,
                              'phone':phoneinputcontroller.text,
                              'email':emailinputcontroller.text,
                              'usertype':category,
                              'password':passwordinputcontroller.text,
                              'status':category=='User'? 1 : 0,
                              'date':DateTime.now(),

                            }).catchError((e)=>showsnackbar('Registration Failed'))).then((value) {
                              showsnackbar('Registered successfully');
                              Navigator.pop(context);


                            }).catchError((e)=>showsnackbar('Registration failed'));
                          }
                        },
                        icon: Icon(Icons.login),
                        label: Text("Sign Up")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showsnackbar(String msg){
    final snackBar = SnackBar( content: Text(msg),backgroundColor: Colors.blue,);


    ScaffoldMessenger.of(context).showSnackBar(
        snackBar
    );
  }

}
