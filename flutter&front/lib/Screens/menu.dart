import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  final int id;
  Menu(this.id);

  Future<Map<dynamic, dynamic>> _menuInfo() async {
    var url = "http://tech123.pythonanywhere.com/rest/info/" + id.toString();
    var data = await http.get(url);
    // print("data testing .....");
    // print(json.decode(data.body));
    return json.decode(data.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return FutureBuilder(
      future: _menuInfo(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          print("Still null!");
          return Scaffold(
            body: Center(
              child: Text("Data Loading......"),
            ),
          );
        } else {
          return Scaffold(
            body: ListView(
              physics:BouncingScrollPhysics(),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 250.0,
                      child: Hero(
                        tag: snapshot.data["name"],
                        child: Image.network(
                          "https://media-cdn.tripadvisor.com/media/photo-m/1280/16/1d/b0/89/indoor-view.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                            iconSize: 30.0,
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            onPressed: () {},
                            iconSize: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      child: Center(
                        child: Text(
                          snapshot.data["location"],
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Robota"),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Items",
                            style: TextStyle(
                              fontFamily: "Georgia",
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                              fontFamily: "Georgia",
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2.0,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Column(
                        children: List.generate(
                          snapshot.data["menu"].length,
                          (index) {
                            // print("Length : ");
                            // print(snapshot.data["menu"].length);
                            if (snapshot.data["menu"].length == 0) {
                              return Center(
                                child: Text("Items to be added!"),
                              );
                            } else
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    snapshot.data["menu"][index]["name"],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: "Yanone Kaffeesatz",
                                    ),
                                  ),
                                  Text(
                                    snapshot.data["menu"][index]["price"]
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: "Yanone Kaffeesatz",
                                    ),
                                  ),
                                ],
                              );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
