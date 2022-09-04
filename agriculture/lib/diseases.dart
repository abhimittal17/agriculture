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
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        const SizedBox(height: 10),
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
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${widget.crop_name}',
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              const Text('DESCRIPTION:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text('${widget.season}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('WATER REQUIRED:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("'${widget.water}'",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('TEMPERATURE:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.Temperature}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('SOIL QUALITY REQUIRED:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.Soil_quality}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('METHOD TO GROW:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.method}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('PLANTATION:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.plantation}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('DISEASE:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.disease}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
                              const Text('SOLUTION:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              const SizedBox(height: 8),
                              Text("${widget.solutions}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              const SizedBox(height: 20),
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
