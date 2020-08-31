import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:sylhetrestaurant/Screens/menu.dart';

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
        scaffoldBackgroundColor: Colors.orange[400],
        primaryColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Georgia',
      ),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Image.network(
            'https://i.imgur.com/OoUnOPB.gif',
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          backgroundColor: Color(0xffB01C2A),
        ),
        body: FutureBuilder(
          initialData: [],
          future: _restaurant_info(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.none) {
              return Center(child: Text("No Internet Connection!"));
            } else if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text(
                "Getting info....",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ));
            } else {
              return ListView.builder(
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
                    child: Card(
                      // color:Theme.of(context).primaryColor,
                      child: ListTile(
                        leading: Hero(
                          tag: snapshot.data[index]["name"],
                          child:
                              Image.network("https://i.imgur.com/gVoh8xO.png"),
                        ),
                        title: Text(
                          snapshot.data[index]["name"],
                          style: TextStyle(
                              color: Color.fromRGBO(223, 143, 61, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          snapshot.data[index]["location"],
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
