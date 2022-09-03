import 'package:agriculture/mandi_prices/crop_prices.dart';
import 'package:agriculture/rentService/rent_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => RentScreen(),));
              },
              child: Text("Rent Machine"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Consultancy"),
            ),ElevatedButton(
              onPressed: () {},
              child: Text("Mandi"),
            ),ElevatedButton(
              onPressed: () {},
              child: Text("Diseases"),
            ),ElevatedButton(
              onPressed: () {},
              child: Text("About Crops"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CropPriceScreen(),));
              },
              child: Text("Harpreet "),
            ),
          ],
        ),
      ),
    );
  }
}
