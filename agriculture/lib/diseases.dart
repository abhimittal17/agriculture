import 'package:flutter/material.dart';

class Diseases extends StatelessWidget {
  String crop_name;
  String season;

  String water;
  String Temperature;
  String Soil_quality;
  // String nutrients_required;
  String method;
  String plantation;
  String disease;
  String solutions;
  String url;

  Diseases(
      {Key? key,
      required this.crop_name,
      required this.url,
      required this.season,
      required this.water,
      required this.Temperature,
      required this.Soil_quality,
      required this.method,
      required this.plantation,
      required this.disease,
      required this.solutions})
      : super(key: key);

  static String routeName = "/diseases";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: ClipRRect(
                  child: Image.network(url),
                  borderRadius: BorderRadius.circular(20)),
            ),

            Text('CROP NAME:${crop_name}'),
            Text('SEASON:${season}'),

            Text('WATER REQUIRED:${water}'),
            Text('TEMPERATURE:${Temperature}'),
            Text('SOIL QUALITY REQUIRED:${Soil_quality}'),
            //  Text('NUTRIENTS REQUIRED:${widget.nutrients_required}'),
            Text('METHOD TO GROW:${method}'),
            Text('PLANTATION:${plantation}'),
            Text('DISEASE:${disease}'),
            Text('Solution:${solutions}'),
          ]),
        ),
      ),
    );
  }
}
