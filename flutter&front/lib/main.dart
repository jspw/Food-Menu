import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sylhetrestaurant/Screens/splashscreen.dart';

void main() => runApp(circularprogress());

class circularprogress extends StatelessWidget {
  @override
  Widget build(BuildContext contextP) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
