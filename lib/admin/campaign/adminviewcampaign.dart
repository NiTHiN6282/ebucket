import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'admincampaigndetails.dart';

class AdminViewCampaign extends StatefulWidget {
  const AdminViewCampaign({Key? key}) : super(key: key);

  @override
  _AdminViewCampaignState createState() => _AdminViewCampaignState();
}

class _AdminViewCampaignState extends State<AdminViewCampaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Campaigns"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('campaign')
                  .where('status', isEqualTo: 1)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text('no campaigns found'));
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff009E60),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 100,
                            width: 200,
                            child: Center(
                              child: ListTile(
                                leading: Text((index + 1).toString()),
                                title:
                                    Text(snapshot.data!.docs[index]['title']),
                                subtitle: Text(
                                    snapshot.data!.docs[index]['description']),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('campaign')
                                          .doc(
                                              snapshot.data!.docs[index]['cid'])
                                          .delete()
                                          .then((value) {
                                        showsnackbar('Campaign deleted');
                                        Navigator.pop(context);
                                      });
                                    }),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminCampaignDetails(
                                        title: snapshot.data!.docs[index]
                                            ['title'],
                                        description: snapshot.data!.docs[index]
                                            ['description'],
                                        link: snapshot.data!.docs[index]
                                            ['link'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      });
              }),
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
