import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:sylhetrestaurant/Screens/menu.dart';
import 'progressbar.dart';

class Restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "ListView List";

    Future<List> _restaurant_info() async {
      var url = "http://tech123.pythonanywhere.com/rest/info/";
      var data = await http.get(url);
      return json.decode(data.body);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Georgia',
        ),
        title: title,
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: SafeArea(
                  child: AppBar(
                title: Center(
                  child: Image.network(
                    'https://i.imgur.com/qVzDcWM.gif',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Color(0xffB01C2A),
              ))),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/menubackground.png"),
                    fit: BoxFit.cover)),
            child: FutureBuilder(
              initialData: [],
              future: _restaurant_info(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return Center(child: Text("No Internet Connection!"));
                } else if (snapshot.data == null ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: circularprogress());
                } else {
                  return Center(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Menu(snapshot.data[index]['id']);
                              },
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 5),
                            decoration: new BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.orange[300].withOpacity(0.4),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: ListTile(
                                leading: Hero(
                                  tag: snapshot.data[index]["name"],
                                  child: Image.network(
                                      "https://i.imgur.com/gVoh8xO.png"),
                                ),
                                title: Text(
                                  snapshot.data[index]["name"],
                                  style: TextStyle(
                                      color: Colors.orange[900],
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "GermaniaOne"),
                                ),
                                subtitle: Text(
                                  snapshot.data[index]["location"],
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
