import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        ],
      ),
    );
  }
}
