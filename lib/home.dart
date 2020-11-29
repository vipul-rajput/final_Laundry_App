import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundryapp_2/widgets/drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:laundryapp_2/widgets/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override


    Widget build(BuildContext context) {
      Widget image_carousel = new Container(
        height: 200.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage("assets/car1.jpg"),
            AssetImage("assets/car2.jpg"),
            AssetImage("assets/car3.jpg"),
            AssetImage("assets/car4.jpg"),

          ],
          dotSize: 4.0,
          indicatorBgPadding: 8.0,
          dotBgColor: Colors.transparent,
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
        ),
      );
      return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Laundry App"),
        ),
        body: Column(
          children: [
            image_carousel,
           SizedBox(
             height: 15,
           ),
            Center(
              child: Text("Services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Services(),
            )
          ],
        ),
      );
    }
  }

