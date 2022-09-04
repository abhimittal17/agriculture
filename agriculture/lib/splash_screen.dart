import 'dart:async';

import 'package:agriculture/authServices/login/login.dart';
import 'package:agriculture/home_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static String routeName = "/splash_screen";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => MyLogin()),
            (route) => false));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff12A278),
      body: Center(
        // scrollDirection: Axis.vertical,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xff12A278),
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
