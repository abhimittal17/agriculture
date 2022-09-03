import 'package:agriculture/controllers/priceController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PriceScreen extends StatelessWidget {
  String cropName;
  PriceScreen({Key? key, required this.cropName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('crops')
                      .doc(cropName.toLowerCase())
                      .collection('prices')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Change in Price: "),
                              Row(
                                children: [
                                  Text(snapshot.data!.docs[1]['percent']
                                          .toString() +
                                      " %"),
                                  snapshot.data!.docs[1]['percent'] > 0
                                      ? Icon(
                                          Icons.arrow_upward,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.arrow_downward,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('crops')
                    .doc(cropName.toLowerCase())
                    .collection('mandiPrice')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mandi 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mandi 2",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mandi 3",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mandi 4",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Mandi 5",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Min Price",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[0]['min']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[1]['min']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[2]['min']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[3]['min']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[4]['min']),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Avg Price",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[0]['price']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[1]['price']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[2]['price']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[3]['price']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[4]['price']),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Max Price",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[0]['max']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[1]['max']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[2]['max']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[3]['max']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data!.docs[4]['max']),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('crops')
                    .doc(cropName.toLowerCase())
                    .collection('prices')
                    .doc('price')
                    .collection('graphPrice')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<PriceData> chartData = [
                      PriceData(
                          DateTime(2017), snapshot.data!.docs[0]['price']),
                      PriceData(
                          DateTime(2018), snapshot.data!.docs[1]['price']),
                      PriceData(
                          DateTime(2019), snapshot.data!.docs[2]['price']),
                      PriceData(
                          DateTime(2020), snapshot.data!.docs[3]['price']),
                      PriceData(
                          DateTime(2021), snapshot.data!.docs[4]['price']),
                      // PriceData(DateTime(2022), snapshot.data!.docs[5]['price']),
                    ];

                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: SfCartesianChart(
                          title: ChartTitle(
                              text: "Wheat",
                              textStyle: TextStyle(
                                  fontSize: 10,
                                  decoration: TextDecoration.underline)),
                          primaryXAxis: DateTimeAxis(),
                          series: [
                            LineSeries(
                              markerSettings: MarkerSettings(isVisible: true),
                              dataSource: chartData,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              xValueMapper: (PriceData priceData, _) =>
                                  priceData.year,
                              yValueMapper: (PriceData priceData, _) =>
                                  priceData.price,
                            )
                          ],
                        ),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
