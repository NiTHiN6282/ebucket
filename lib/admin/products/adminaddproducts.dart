import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminAddProducts extends StatefulWidget {
  const AdminAddProducts({Key? key}) : super(key: key);

  @override
  _AdminAddProductsState createState() => _AdminAddProductsState();
}

class _AdminAddProductsState extends State<AdminAddProducts> {
  var url;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  var apid;
  var _addproductskey = new GlobalKey<FormState>();
  TextEditingController productnameinputcontroller =
      new TextEditingController();
  TextEditingController descriptioninputcontroller =
      new TextEditingController();
  TextEditingController priceinputcontroller = new TextEditingController();

  void initState() {
    apid = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Form(
          key: _addproductskey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: productnameinputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      prefixIcon: Icon(Icons.business_center),
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
                    controller: descriptioninputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      prefixIcon: Icon(Icons.description),
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
                    controller: priceinputcontroller,
                    decoration: InputDecoration(
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
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Container(
                      width: 250,
                      height: 250,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(_image!.path),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              color: Colors.grey,
                              child: Icon(
                                Icons.camera_alt,
                                size: 200,
                                color: Colors.grey[100],
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (_image == null) {
                            showsnackbar('insert image');
                          } else if (_addproductskey.currentState!.validate()) {
                            String fileName = DateTime.now().toString();

                            var ref = FirebaseStorage.instance
                                .ref()
                                .child('products/$fileName');
                            UploadTask uploadTask =
                                ref.putFile(File(_image!.path));

                            uploadTask.then((res) async {
                              url = (await ref.getDownloadURL()).toString();
                            }).then((value) => FirebaseFirestore.instance
                                    .collection("recycleproducts")
                                    .doc(apid)
                                    .set({
                                  "productname":
                                      productnameinputcontroller.text,
                                  "description":
                                      descriptioninputcontroller.text,
                                  "price": priceinputcontroller.text,
                                  "status": 1,
                                  "apid": apid,
                                  "createdDate": DateTime.now(),
                                  "fileName": fileName,
                                  'url': url,
                                }).then((value) {
                                  showsnackbar("Succesfully Added!");
                                  Navigator.pop(context);
                                }));
                          }
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add Product")),
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

  _imgFromGallery() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);

    setState(() {
      _image = image;
    });
  }

  _imgFromCamera() async {
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 70);

    setState(() {
      _image = photo;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
