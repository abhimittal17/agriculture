import 'dart:async';

import 'package:agriculture/home_screen.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget { 
  static String routeName = "/splash_screen";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  @override
  void initState() {
    
    Timer(const Duration(seconds:4), ()=> 
    Navigator.pushAndRemoveUntil(context, 
    MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>MyHomePage(),
        ),
     (route) => false)
    );
    super.initState();
  } 
 Widget build (BuildContext context) {
  return Scaffold( 
         body:SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child:Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                color:Colors.green,
                image:DecorationImage(
                  image: AssetImage('images/app_logo.jpg'),
                  fit:BoxFit.cover,
                ),
              ),
             
             ),
            ),
           );
          }
         }