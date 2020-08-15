import 'dart:async';
import 'package:flutter/material.dart';
import 'listview.dart';
import 'menu_item.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => menuitemlist())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(
                  'https://i.imgur.com/KS9AbXK.png',
                ),
                fit: BoxFit.cover)),
        child: Image.network('https://i.imgur.com/o4ZRh9k.png'),
      ),
    );
  }
}
