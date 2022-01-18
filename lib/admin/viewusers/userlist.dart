import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebucket/admin/viewusers/userdetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Users List"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('user').where('status',isEqualTo: 1).where('usertype',isEqualTo: 'User').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasData&&snapshot.data!.docs.length==0)
                {
                  return Center(child: Text('no users found'));

                }
              else {
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
                            title: Text(snapshot.data!.docs[index]['name']),
                            subtitle: Text(snapshot.data!.docs[index]['phone']),
                            trailing: IconButton(
                                icon: Icon(Icons.call, color: Colors.blue),
                                onPressed: () {
                                  launch("tel:${snapshot.data!.docs[index]['phone']}");
                                }),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetails(
                                    names: snapshot.data!.docs[index]['name'],
                                    phoneno: snapshot.data!.docs[index]['phone'],
                                    email: snapshot.data!.docs[index]['email'],
                                    address: snapshot.data!.docs[index]['address'],
                                    location: snapshot.data!.docs[index]['location'],
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
            }
          ),
        ),
      ),
    );
  }
}
