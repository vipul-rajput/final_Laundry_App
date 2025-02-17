import 'package:flutter/material.dart';
import 'package:laundryapp_2/models/list.dart';

class Wash extends StatefulWidget {
  @override
  _WashState createState() => _WashState();
}

class _WashState extends State<Wash> {
  _colthsCount(count){
    count++;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*4/7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Color(0xff0fb2ea)],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.7),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              onPressed:()=> Navigator.pop(context),
              icon: Icon(Icons.arrow_back,
                color: Colors.white,
                size: 25,),
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            child: Text(
              "Categories",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Positioned(
            top: 135,
            left: 20,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context,index){
                  bool isSelected = false;
                  if (index == 0) {
                    isSelected = true;
                  }
                  return Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                                color: isSelected?
                                Colors.white:
                                Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                boxShadow: isSelected
                                    ?[
                                  BoxShadow(
                                      color: Color(0x14000000),
                                      blurRadius: 10
                                  )
                                ]: null
                            ),
                            child: Center(
                              child: Image.asset(categoryData[index].imageUrl),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            categoryData[index].name,
                            style:
                            TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,)
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 240,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                _customCard(
                    imageUrl: "tshirt.png", item: "T-shirt", price: "\$0.50", count: 5
                ),
                _customCard(
                    imageUrl: "shirt.png", item: "Shirt", price: "\$0.50", count: 5
                ),
                _customCard(
                    imageUrl: "blouse.png", item: "T-shirt", price: "\$0.50", count: 5
                ),
                _customCard(
                    imageUrl: "hoodie.png", item: "T-shirt", price: "\$0.50", count: 5
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text("Hello",
              style: TextStyle(
                  color: Colors.black, fontSize: 20
            ),),
          )
        ],
      ),
    );
  }
  _customCard({String imageUrl, String item, String price, int count}){
    return SizedBox(
      height: 190,
      width: 160,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                item,
                style: TextStyle(fontSize: 24),
              ),
              Image.asset("assets/page1/" + imageUrl),
              Text(price),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue
                        ),
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white
                    ),
                    child: IconButton(
                      onPressed:(){},
                      icon: Icon(Icons.remove,
                        color: Colors.black,
                        size: 25,),
                    ),
                  ),
                  Text("$count",
                  style:TextStyle(
                    fontSize: 25,
                  )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue
                        ),
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white
                    ),
                    child: IconButton(
                      onPressed:(){_colthsCount(count);},
                      icon: Icon(Icons.add,
                        color: Colors.black,
                        size: 25,),
                  ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
