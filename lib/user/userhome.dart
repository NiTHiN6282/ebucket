
import 'package:ebucket/common/models.dart';
import 'package:ebucket/styles/textstyles.dart';
import 'package:ebucket/user/categoryform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:flutter_page_indicator_tv/flutter_page_indicator.dart';

class UserHome extends StatefulWidget {
  var uid;
  var name;
  var address;
  var location;
  var phone;
  var email;
  var category;

   UserHome({Key? key,this.uid,this.name,this.address,this.location,this.phone,this.email,this.category}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var selected=0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return

         SingleChildScrollView(
           scrollDirection: Axis.vertical,
             child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _slider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 2, top: 20),
                      child: Text(
                        "Fill Your Bucket",
                        style: mainhead,
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Text(
                        "Select Category",
                        style: subhead,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8,bottom: 8),
                      child: Row(
                        children: [
                          _cards('Monitors',Icons.computer,Colors.black87,Colors.red,1),
                          _cards('Oven',Icons.all_inbox,Colors.black87,Colors.orange,2),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,bottom: 8),
                      child: Row(
                        children: [
                          _cards('CPU',Icons.account_box,Colors.black87,Colors.red,3),
                          _cards('Fridge',Icons.outbox,Colors.black87,Colors.orange,4),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,bottom: 8),
                      child: Row(
                        children: [
                          _cards('Mobile',Icons.account_box,Colors.black87,Colors.red,5),
                          _cards('Cooler',Icons.outbox,Colors.black87,Colors.orange,6),
                        ],
                      ),
                    ),

                  ]),

       ),

         );
  }

  Widget _slider() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 5,
      child: Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
          ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                gallery[index],
                fit: BoxFit.cover,
              );
            },
            indicatorLayout: PageIndicatorLayout.COLOR,
            autoplay: true,
            itemCount: gallery.length,
          )
      ),
    );
  }

  _cards(String title,IconData icons,Color color1,Color color2,var index) {
    return GestureDetector(
      onTap: (){
        if(index==1){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryForm(category: 'Monitors',uid: widget.uid,name: widget.name,address: widget.address,location: widget.location,phone: widget.phone,email: widget.email,)));
        }else if(index==2){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryForm(category: 'oven',uid: widget.uid,name: widget.name,address: widget.address,location: widget.location,phone: widget.phone,email: widget.email,)));
        }else if(index==3){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryForm(category: 'cpu',uid: widget.uid,name: widget.name,address: widget.address,location: widget.location,phone: widget.phone,email: widget.email,)));
        }else if(index==4){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryForm(category: 'fridge',uid: widget.uid,name: widget.name,address: widget.address,location: widget.location,phone: widget.phone,email: widget.email,)));
        }else if(index==5){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryForm(category: 'Mobile',uid: widget.uid,name: widget.name,address: widget.address,location: widget.location,phone: widget.phone,email: widget.email,)));
        }else if(index==6){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryForm(category: 'Cooler',uid: widget.uid,name: widget.name,address: widget.address,location: widget.location,phone: widget.phone,email: widget.email,)));
        }

        // setState(() {
        //   selected=1;
        //
        // });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20),
        child: Card(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(
              color:   selected==0? Colors.black:Colors.green,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                // gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [color1, color2])
       ),
            height: 150,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                 icons,
                  color: Colors.white,
                  size: 65,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: cardtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
