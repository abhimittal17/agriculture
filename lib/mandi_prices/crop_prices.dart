import 'package:flutter/material.dart';

class CropPriceScreen extends StatelessWidget {
  CropPriceScreen({Key? key}) : super(key: key);
  final TextEditingController cropcontroller = TextEditingController();
  String cropvalue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("Crop Prices:",
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (value) {
              cropvalue = value;
              print(cropvalue);
            },
            controller: cropcontroller,
            decoration: const InputDecoration(
              hintText: "Search Crop",
              border: OutlineInputBorder(),
            ),
          ),
        ),
          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       leading: Text(index.toString()),
          //     );
          //   },
          // )
          ],),
      ),
    );
  }
}
