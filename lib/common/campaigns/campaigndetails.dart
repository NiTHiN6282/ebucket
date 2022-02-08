import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
          padding: const EdgeInsets.all(20.0),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

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
                  Text("Link",style: GoogleFonts.lato(
                      fontSize: 20,

                  ),),
                  SizedBox(
                  width: 20,
                  ),
                  GestureDetector(
                    onDoubleTap: (){
                      launch(widget.link);
                    },
                    child:
                     Text(widget.link,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.blue
                      ),
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
