import 'package:flutter/material.dart';
import 'package:laundryapp_2/widgets/drawer.dart';

class Wash extends StatefulWidget {
  @override
  _WashState createState() => _WashState();
}

class _WashState extends State<Wash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Wash"),
        ),
        body: Container(),
    );
  }
}
