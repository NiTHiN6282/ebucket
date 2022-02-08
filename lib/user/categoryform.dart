import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/styles/colors.dart';
import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  var category;
  var uid;
  var name;
  var address;
  var location;
  var phone;
  var email;
   CategoryForm({Key? key,this.category,this.uid,this.name,this.address,this.location,this.phone,this.email}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  var _categorykey = new GlobalKey<FormState>();
  TextEditingController categoryinputcontroller = new TextEditingController();
  TextEditingController quantityinputcontroller = new TextEditingController();
  TextEditingController priceinputcontroller = new TextEditingController();
  TextEditingController phoneinputcontroller = new TextEditingController();
  TextEditingController emailinputcontroller = new TextEditingController();
  TextEditingController locationinputcontroller = new TextEditingController();
  var eid;
  @override
  void initState() {
    eid=DateTime.now().toString();
    categoryinputcontroller.text=widget.category;
    locationinputcontroller.text=widget.location;
    phoneinputcontroller.text=widget.phone;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text("E-Bucket"),
      ),
      body: SafeArea(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
              image: DecorationImage(

                fit: BoxFit.cover,
                image: AssetImage('images/backimage.jpg')
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.transparent

                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Form(

                key: _categorykey,
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
                        TextFormField(
                          controller: categoryinputcontroller,
                          enabled: false,
                          decoration: InputDecoration(

                            labelText: 'category',
                            prefixIcon: Icon(Icons.category),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: quantityinputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),

                                borderRadius: BorderRadius.circular(10),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),

                              borderRadius: BorderRadius.circular(10),

                            ),

                            fillColor: Colors.white70,
                            filled: true,
                            hintText: 'Quantity in KG',
                            //labelText: 'Quantity',
                            labelStyle: TextStyle(color: Colors.black87),
                            prefixIcon: Icon(Icons.production_quantity_limits,color: Colors.black,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                        if (value!.length < 1) return 'This field must be filled!';
                      },
                    ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: priceinputcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Price in Rupees',
                            labelText: 'Price',
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          validator: (value) {
                            if (value!.length < 1)
                              return 'This field must be filled!';
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: locationinputcontroller,
                          decoration: InputDecoration(
                            labelText: 'Location',
                            prefixIcon: Icon(Icons.add_location),
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
                            prefixIcon: Icon(Icons.add_call),
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

                        Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(80),
                          // ),
                          width: 150,
                          height: 44,
                          child: ElevatedButton.icon(
                            style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)) ,
                              onPressed: () {
                                if (_categorykey.currentState!.validate()) {
                                  FirebaseFirestore.instance.collection('ewastes').doc(eid).set({
                                    'eid':eid,
                                    'uid': widget.uid,
                                    'name':widget.name,
                                    'address':widget.address,
                                    'location':locationinputcontroller.text,
                                    'phone':phoneinputcontroller.text,
                                    'category':widget.category,
                                    'quantity':quantityinputcontroller.text,
                                    'price':priceinputcontroller.text,
                                    'status':1,
                                    'date':DateTime.now().toString()

                                  }).then((value) {
                                    showsnackbar('Ewaste Submitted');
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              icon: Icon(Icons.done),
                              label: Text("submit")),
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
          )
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
