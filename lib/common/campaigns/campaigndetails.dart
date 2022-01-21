import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CampaignDetails extends StatefulWidget {
  var title;
  var description;
  var link;

  CampaignDetails({this.title, this.description, this.link});

  @override
  _CampaignDetailsState createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campaigns"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(widget.title,
                style: GoogleFonts.lato(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.description,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Link: '+widget.link,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
