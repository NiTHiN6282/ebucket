import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAdminCampaign extends StatefulWidget {
  const AddAdminCampaign({Key? key}) : super(key: key);

  @override
  _AddAdminCampaignState createState() => _AddAdminCampaignState();
}

class _AddAdminCampaignState extends State<AddAdminCampaign> {
  var addcampaignkey = new GlobalKey<FormState>();
  TextEditingController titleinputcontroller = new TextEditingController();
  TextEditingController descriptioninputcontroller =
      new TextEditingController();
  TextEditingController linkinputcontroller = new TextEditingController();
  var cid;

  @override
  void initState() {
    cid = DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campaigns"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: addcampaignkey, // set key(it specifies the form
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            // all _all align
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  Center(
                      child: Text(
                    "Add Campaign",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 30,
                  ), //align center
                  // Image.asset('images/demo2.png',height: 100,width: 500,),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: titleinputcontroller,

                    decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'abc bd',
                        prefixIcon: Icon(Icons.title),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      //anonymous function
                      if (value!.length <= 1) return 'mandatory';
                    }, //check whether its correct
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: descriptioninputcontroller,
                    //obscureText: true,

                    decoration: InputDecoration(
                        labelText: 'description',
                        //hintText: '********',
                        prefixIcon: Icon(Icons.description),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.length <= 1) return ' pls add description';
                    }, //check whether its correct
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: linkinputcontroller,
                    //obscureText: true,

                    decoration: InputDecoration(
                        labelText: 'link',
                        //hintText: '********',
                        prefixIcon: Icon(Icons.link),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.length <= 5) return ' pls add description';
                    }, //check whether its correct
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (addcampaignkey.currentState!.validate()) {
                            FirebaseFirestore.instance
                                .collection('campaign')
                                .doc(cid)
                                .set({
                              'cid': cid,
                              'title': titleinputcontroller.text,
                              'description': descriptioninputcontroller.text,
                              'link': linkinputcontroller.text,
                              'status': 1,
                              'date': DateTime.now()
                            }).then((value) {
                              showsnackbar('Campaign Added');
                              Navigator.pop(context);
                            });
                          }
                        },
                        icon: Icon(Icons.save),
                        label: Text("ADD")),
                  ),
                  SizedBox(
                    height: 30,
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
