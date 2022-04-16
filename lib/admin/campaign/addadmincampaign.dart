import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAdminCampaign extends StatefulWidget {
  const AddAdminCampaign({Key? key}) : super(key: key);

  @override
  _AddAdminCampaignState createState() => _AddAdminCampaignState();
}

class _AddAdminCampaignState extends State<AddAdminCampaign> {
  var addcampaignkey = GlobalKey<FormState>();
  TextEditingController titleinputcontroller = TextEditingController();
  TextEditingController descriptioninputcontroller = TextEditingController();
  TextEditingController linkinputcontroller = TextEditingController();
  dynamic cid;

  @override
  void initState() {
    cid = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campaigns"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: addcampaignkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  const Center(
                      child: Text(
                    "Add Campaign",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: titleinputcontroller,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'abc bd',
                        prefixIcon: const Icon(Icons.title),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.length <= 1) return 'mandatory';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: descriptioninputcontroller,
                    decoration: InputDecoration(
                        labelText: 'description',
                        prefixIcon: const Icon(Icons.description),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      if (value!.length <= 1) return ' pls add description';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: linkinputcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'link',
                        prefixIcon: const Icon(Icons.link),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (value) {
                      const pattern =
                          r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                      final regExp = RegExp(pattern);

                      if (value!.isEmpty) {
                        return 'Enter an link';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Enter a valid link';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
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
                        icon: const Icon(Icons.save),
                        label: const Text("ADD")),
                  ),
                  const SizedBox(
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
