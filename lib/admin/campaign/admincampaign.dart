import 'package:ebucket/admin/campaign/addadmincampaign.dart';
import 'package:ebucket/admin/campaign/adminviewcampaign.dart';
import 'package:flutter/material.dart';

class AdminCampaign extends StatefulWidget {
  const AdminCampaign({Key? key}) : super(key: key);

  @override
  _AdminCampaignState createState() => _AdminCampaignState();
}

class _AdminCampaignState extends State<AdminCampaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff246EE9),
        title: const Text("Campaign"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffFF4060),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.campaign,
                      size: 40,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("View Campaigns"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminViewCampaign()));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffFF4060),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("Add Campaign"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAdminCampaign()));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
