import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  dynamic category;
  final _loginkey = GlobalKey<FormState>();
  TextEditingController nameinputcontroller = TextEditingController();
  TextEditingController addressinputcontroller = TextEditingController();
  TextEditingController phoneinputcontroller = TextEditingController();
  TextEditingController emailinputcontroller = TextEditingController();
  TextEditingController passwordinputcontroller = TextEditingController();
  TextEditingController locationinputcontroller = TextEditingController();

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
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length < 3) return 'Invalid Name';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: const Icon(Icons.home),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: locationinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      prefixIcon: const Icon(Icons.home),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phoneinputcontroller,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Phone no.',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return 'Number should contain 10 characters!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailinputcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      const pattern =
                          r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                      final regExp = RegExp(pattern);

                      if (value!.isEmpty) {
                        return 'Enter an email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Enter a valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: category,
                    decoration: InputDecoration(
                      hintText: "Category",
                      prefixIcon: const Icon(Icons.email),
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordinputcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Password must be at least 6 characters long';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_loginkey.currentState!.validate()) {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailinputcontroller.text,
                                    password: passwordinputcontroller.text)
                                .then((value) => FirebaseFirestore.instance
                                        .collection('user')
                                        .doc(value.user!.uid)
                                        .set({
                                      'uid': value.user!.uid,
                                      'name': nameinputcontroller.text,
                                      'address': addressinputcontroller.text,
                                      'location': locationinputcontroller.text,
                                      'phone': phoneinputcontroller.text,
                                      'email': emailinputcontroller.text,
                                      'usertype': category,
                                      'status': category == 'User' ? 1 : 0,
                                      'date': DateTime.now(),
                                    }).catchError((e) => showsnackbar(
                                            'Registration Failed')))
                                .then((value) {
                              showsnackbar('Registered successfully');
                              Navigator.pop(context);
                            }).catchError(
                                    (e) => showsnackbar('Registration failed'));
                          }
                        },
                        icon: const Icon(Icons.login),
                        label: const Text("Sign Up")),
                  ),
                  const SizedBox(
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

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
