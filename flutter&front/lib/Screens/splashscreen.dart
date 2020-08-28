import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sylhetrestaurant/Screens/restaurants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation = new Tween(begin: 100.0, end: 400.0).animate(curve);
    animation.addStatusListener(listener);
    controller.forward();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Restaurants())));
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  Widget builder(BuildContext context, Widget child) {
    return new Container(
      height: animation.value,
      width: animation.value,
      child: Image.asset(
        'assets/images/splashscreen_main.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/splashscreen_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Stack(
              children: <Widget>[
                AnimatedBuilder(animation: animation, builder: builder),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
