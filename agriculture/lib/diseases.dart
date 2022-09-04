import 'package:flutter/material.dart';

class Diseases extends StatefulWidget {
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
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.green.shade100,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(widget.url),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.crop_name}',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text('DESCRIPTION:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text('${widget.season}',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('WATER REQUIRED:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("'${widget.water}'",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('TEMPERATURE:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.Temperature}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('SOIL QUALITY REQUIRED:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.Soil_quality}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('METHOD TO GROW:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.method}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('PLANTATION:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.plantation}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('DISEASE:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.disease}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height: 20),
                              Text('SOLUTION:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.solutions}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                              SizedBox(height:20),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
