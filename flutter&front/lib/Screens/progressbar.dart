import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:sylhetrestaurant/Screens/menu.dart';

class circularprogress extends StatefulWidget {
  @override
  _circularprogressState createState() => _circularprogressState();
}

class _circularprogressState extends State<circularprogress> {
  Icon fab = Icon(
    Icons.refresh,
  );

  bool showProgress = true;

  void toggleSubmitState() {
    setState(() {
      showProgress = !showProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/menubackground.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
          body: Center(
        child: Column(children: <Widget>[
          Container(
            child: CircularProgressIndicator(),
            margin: EdgeInsets.all(90),
          ),
          Container(
            child: Text(
              'Loading...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.all(0),
          ),
        ]),
      )),
    );
  }
}
