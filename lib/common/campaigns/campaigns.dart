
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/common/campaigns/campaigndetails.dart';
import 'package:flutter/material.dart';

class ViewCampaigns extends StatefulWidget {
  const ViewCampaigns({Key? key}) : super(key: key);

  @override
  _ViewCampaignsState createState() => _ViewCampaignsState();
}

class _ViewCampaignsState extends State<ViewCampaigns> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('campaign').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasData&&snapshot.data!.docs.length==0)
              {
                return Center(child: Text('no campaigns found'));

              }
              else
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          color: Color(0xff009E60),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 100,
                        width: 200,
                        child: Center(
                          child: ListTile(
                            leading: Text((index + 1).toString()),
                            title: Text(snapshot.data!.docs[index]['title']),
                            subtitle: Text(snapshot.data!.docs[index]['description']),

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CampaignDetails(
                                    title: snapshot.data!.docs[index]['title'],
                                    description: snapshot.data!.docs[index]['description'],
                                    link: snapshot.data!.docs[index]['link'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  });
            }
          ),
        ),
      ),

    );
  }
}
