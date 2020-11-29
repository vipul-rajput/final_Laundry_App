import 'package:flutter/material.dart';
import 'package:laundryapp_2/home.dart';
import 'package:laundryapp_2/signIn.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/person.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ),

                Text(
                  'Mike',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () => {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            )
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn())),
          ),
        ],
      ),
    );
  }
}