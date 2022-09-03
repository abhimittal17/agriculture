// import 'dart:html';

import 'package:agriculture/crops.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Rent Machine"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Consultancy"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Mandi"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Diseases"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Crops()));
            },
            child: Text("About Crops"),
          ),
        ],
      ),
    );
  }
}
