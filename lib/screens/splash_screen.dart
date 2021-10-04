import 'dart:async';

import 'package:flutter/material.dart';
import '/screens/home_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/movies_logo.png',
              height: 300,
              width: 250,
            ),
            Text('Movies App', style: Theme.of(context).textTheme.headline6)
          ],
        ));
  }
}

@override
Widget build(BuildContext context) {
  return Container();
}
