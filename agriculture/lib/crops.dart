import 'package:agriculture/diseases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      // appBar: AppBar(title: const Text('Crops')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('crops').snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String name = snapshot.data!.docs[index]['name'];
                  String image = snapshot.data!.docs[index]['imageUrl'];
                  String season = snapshot.data!.docs[index]['season'];
                  String water = snapshot.data!.docs[index]['water'];
                  String temp = snapshot.data!.docs[index]['temp'];
                  String soil = snapshot.data!.docs[index]['soil'];
                  String plantation = snapshot.data!.docs[index]['plantation'];
                  String method = snapshot.data!.docs[index]['method'];
                  String disease = snapshot.data!.docs[index]['diseases'];
                  String solutions = snapshot.data!.docs[index]['solution'];

                  return recommended(image, name, season, temp, soil, water,
                      plantation, method, disease, solutions, context);
                },
                //scrollDirection: Axis.vertical,
                primary: false,
                // children: <Widget>[
                //   recommended("assets/rice.jpg", "Rice", "Kharif",
                //       "22-32 degree Celsius", "Deep clayey and loamy soil"),
                //   recommended("assets/wheat.jpg", "Wheat", "Rabi",
                //       " 10-15 degree Celsius ", "Well-drained fertile loamy"),
                //   recommended("assets/sugarcane.jpg", "Sugarcane", "Kharif",
                //       " 21-27 degree Celsius ", " Deep rich loamy soil"),
                //   recommended("assets/tea.jpg", "Tea", "Kharif",
                //       "20-30 degree Celsius ", "deep friable loamy soil"),
                //   recommended("assets/coffee.jpg", "Coffee", "Kharif",
                //       "15-28 degree Celsius ", "deep friable loamy soil"),
                //   recommended("assets/cotton.jpg", "Cotton", "Kharif",
                //       "21-30 degree Celsius ", "Black soil of Deccan Plateau"),
                // ],
              );
            }),
      ),
    );
  }
}

Widget recommended(
    String imgpath,
    String name,
    String season,
    String temp,
    String soil,
    String water,
    String plantation,
    String method,
    String disease,
    String solution,
    BuildContext context) {
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
                  child: Image.network(
                    imgpath,
                    // height: 100,
                    // width: 150,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Expanded(
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
                      Text("Season: $season",
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
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Diseases(
                                crop_name: name,
                                season: season,
                                water: water,
                                Temperature: temp,
                                Soil_quality: soil,
                                method: method,
                                plantation: plantation,
                                disease: disease,
                                solutions: solution,
                                url: imgpath),
                          ));
                    },
                    child: const Text("Read more"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
