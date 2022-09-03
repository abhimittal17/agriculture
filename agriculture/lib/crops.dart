import 'package:flutter/material.dart';

class Crops extends StatefulWidget {
  const Crops({super.key});

  @override
  State<Crops> createState() => _CropsState();
}

class _CropsState extends State<Crops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crops')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          //scrollDirection: Axis.vertical,
          primary: false,
          children: <Widget>[
            recommended("assets/rice.jpg", "Rice", "Kharif",
                "22-32 degree Celsius", "Deep clayey and loamy soil"),
            recommended("assets/wheat.jpg", "Wheat", "Rabi",
                " 10-15 degree Celsius ", "Well-drained fertile loamy"),
            recommended("assets/sugarcane.jpg", "Sugarcane", "Kharif",
                " 21-27 degree Celsius ", " Deep rich loamy soil"),
            recommended("assets/tea.jpg", "Tea", "Kharif",
                "20-30 degree Celsius ", "deep friable loamy soil"),
            recommended("assets/coffee.jpg", "Coffee", "Kharif",
                "15-28 degree Celsius ", "deep friable loamy soil"),
            recommended("assets/cotton.jpg", "Cotton", "Kharif",
                "21-30 degree Celsius ", "Black soil of Deccan Plateau"),
          ],
        ),
      ),
    );
  }
}

Widget recommended(
    String imgpath, String name, String title, String temp, String soil) {
  return SizedBox(
    width: 100,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: SizedBox(
                width: 380,
                height: 175,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    imgpath,
                    // height: 100,
                    // width: 150,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text("Season: $title",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.start),
                      Text("Temperature: $temp",
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.start),
                      Text("Soil: $soil",
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.start),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 110,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ),
                          onPressed: () {},
                          child: const Text("Read more"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
