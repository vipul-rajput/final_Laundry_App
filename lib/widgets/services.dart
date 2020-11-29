import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundryapp_2/wash.dart';

class Services extends StatelessWidget {
  _customCard({String imageUrl, String item, String duration}){
    return SizedBox(
      height: 168,
      width: 150,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/services/" + imageUrl),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(duration)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Wash()));
                },
                child:  _customCard(
                    imageUrl: "washing-machine.png",
                    item: "Wash",
                    duration: "1 Day"
                ),
              ),
              GestureDetector(
                onTap:(){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Detailes()));
                },
                child:  _customCard(
                    imageUrl: "dry.png",
                    item: "Dry Clean",
                    duration: "1 Day"
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:(){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Detailes()));
                },
                child:  _customCard(
                    imageUrl: "premium.png",
                    item: "Premium Combos",
                    duration: "1 Day"
                ),
              ),
              GestureDetector(
                onTap:(){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Detailes()));
                },
                child:  _customCard(
                    imageUrl: "other.png",
                    item: "Other",
                    duration: "1 Day"
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
//  _customCard1({String imageUrl, String item, String price, int count}){
//    return SizedBox(
//      height: 190,
//      width: 160,
//      child: Card(
//        color: Colors.white,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(20),
//        ),
//        elevation: 10,
//        child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                item,
//                style: TextStyle(fontSize: 24),
//              ),
//              Image.asset("assets/page1/" + imageUrl),
//              Text(price),
//              Divider(),
//              Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                        border: Border.all(
//                            color: Colors.blue
//                        ),
//                        borderRadius: BorderRadius.circular(100),
//                        color: Colors.white
//                    ),
//                    child: Text(" - ",
//                      style: TextStyle(fontSize: 28,letterSpacing: 3),),
//                  ),
//                  Text("$count"),
//                  Container(
//                    decoration: BoxDecoration(
//                        border: Border.all(
//                            color: Colors.blue
//                        ),
//                        borderRadius: BorderRadius.circular(100),
//                        color: Colors.white
//                    ),
//                    child: Text(" + ",
//                      style: TextStyle(fontSize: 28,letterSpacing: 1),),
//                  ),
//                ],
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}
