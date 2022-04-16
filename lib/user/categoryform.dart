import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryForm extends StatefulWidget {
  dynamic category;
  dynamic uid;
  dynamic name;
  dynamic address;
  dynamic location;
  dynamic phone;
  dynamic email;

  CategoryForm(
      {Key? key,
      this.category,
      this.uid,
      this.name,
      this.address,
      this.location,
      this.phone,
      this.email})
      : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _categorykey = GlobalKey<FormState>();
  TextEditingController categoryinputcontroller = TextEditingController();
  TextEditingController quantityinputcontroller = TextEditingController();
  TextEditingController priceinputcontroller = TextEditingController();
  TextEditingController phoneinputcontroller = TextEditingController();
  TextEditingController emailinputcontroller = TextEditingController();
  TextEditingController locationinputcontroller = TextEditingController();
  dynamic eid;

  @override
  void initState() {
    eid = DateTime.now().toString();
    categoryinputcontroller.text = widget.category;
    locationinputcontroller.text = widget.location;
    phoneinputcontroller.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: const Text("E-Bucket"),
      ),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200.withOpacity(0.5),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Form(
            key: _categorykey,
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
                    TextFormField(
                      controller: categoryinputcontroller,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'category',
                        prefixIcon: const Icon(Icons.category),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: quantityinputcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Quantity in KG',
                        labelText: 'Quantity',
                        prefixIcon:
                            const Icon(Icons.production_quantity_limits),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field must be filled!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: priceinputcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Price in Rupees',
                        labelText: 'Price',
                        prefixIcon: const Icon(Icons.attach_money),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field must be filled!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: locationinputcontroller,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        prefixIcon: const Icon(Icons.add_location),
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
                        prefixIcon: const Icon(Icons.add_call),
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
                    SizedBox(
                      width: 150,
                      height: 44,
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            if (_categorykey.currentState!.validate()) {
                              FirebaseFirestore.instance
                                  .collection('ewastes')
                                  .doc(eid)
                                  .set({
                                'eid': eid,
                                'uid': widget.uid,
                                'name': widget.name,
                                'address': widget.address,
                                'location': locationinputcontroller.text,
                                'phone': phoneinputcontroller.text,
                                'category': widget.category,
                                'quantity': quantityinputcontroller.text,
                                'price': priceinputcontroller.text,
                                'status': 1,
                                'date': DateTime.now().toString()
                              }).then((value) {
                                showsnackbar('Ewaste Submitted');
                                Navigator.pop(context);
                              });
                            }
                          },
                          icon: const Icon(Icons.done),
                          label: const Text("submit")),
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
      )),
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
