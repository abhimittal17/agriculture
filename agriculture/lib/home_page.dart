import 'package:agriculture/controllers/home_controller.dart';
import 'package:agriculture/diseases.dart';
import 'package:agriculture/weather_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('crops').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    WeatherWidget(),
                    InkWell(
                      onTap: () {
                        homeController.index.value = 1;
                      },
                      child: SizedBox(
                        width: double.infinity,
                        // height: 250,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Current Prices"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Table(children: [
                                  //   TableRow(children: [
                                  //     Text(
                                  //       "Sr.No",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 16),
                                  //     ),
                                  //     Text(
                                  //       "Crop Name",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 16),
                                  //     ),
                                  //     Text(
                                  //       "Mandi 1",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 16),
                                  //     ),
                                  //     Text(
                                  //       "Mandi 2",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 16),
                                  //     ),
                                  //     Text(
                                  //       "Mandi 3",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 16),
                                  //     ),
                                  //   ]),
                                  //   // TableRow(children: [
                                  //   //   StreamBuilder(
                                  //   //     builder: (context, psSnap) {
                                  //   //       List<Widget> rowList = [
                                  //   //         Text((i + 1).toString() + ". "),
                                  //   //         Text(snapshot.data!.docs[i]
                                  //   //             ['name']),
                                  //   //         Text(priceSnapshot.data!.docs[0]
                                  //   //             ['price']),
                                  //   //         Text(priceSnapshot.data!.docs[1]
                                  //   //             ['price']),
                                  //   //         Text(priceSnapshot.data!.docs[2]
                                  //   //             ['price']),
                                  //   //       ];
                                  //   //       return rowList;
                                  //   //     },
                                  //   //   )
                                  //   // ])
                                  // ]),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sr.No",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Crop Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Mandi 1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Mandi 2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Mandi 3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    // width: 250,
                                    height: 240,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: StreamBuilder<
                                                  QuerySnapshot<
                                                      Map<String, dynamic>>>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('crops')
                                                  .doc(snapshot
                                                      .data!.docs[index]['name']
                                                      .toString()
                                                      .toLowerCase())
                                                  .collection('mandiPrice')
                                                  .snapshots(),
                                              builder:
                                                  (context, priceSnapshot) {
                                                if (priceSnapshot
                                                        .connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text((index + 1)
                                                              .toString() +
                                                          ". "),
                                                      Text(snapshot.data!
                                                          .docs[index]['name']),
                                                      Text(priceSnapshot.data!
                                                          .docs[0]['price']),
                                                      Text(priceSnapshot.data!
                                                          .docs[1]['price']),
                                                      Text(priceSnapshot.data!
                                                          .docs[2]['price']),
                                                    ],
                                                  );
                                                }
                                              }),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      width: 500,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                homeController.index.value = 3;
                                String name =
                                    snapshot.data!.docs[index]['name'];
                                String image =
                                    snapshot.data!.docs[index]['imageUrl'];
                                String season =
                                    snapshot.data!.docs[index]['season'];
                                String water =
                                    snapshot.data!.docs[index]['water'];
                                String temp =
                                    snapshot.data!.docs[index]['temp'];
                                String soil =
                                    snapshot.data!.docs[index]['soil'];
                                String plantation =
                                    snapshot.data!.docs[index]['plantation'];
                                String method =
                                    snapshot.data!.docs[index]['method'];
                                String disease =
                                    snapshot.data!.docs[index]['diseases'];
                                String solutions =
                                    snapshot.data!.docs[index]['solution'];
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Diseases(
                                        crop_name: name,
                                        url: image,
                                        season: season,
                                        water: water,
                                        Temperature: temp,
                                        Soil_quality: soil,
                                        method: method,
                                        plantation: plantation,
                                        disease: disease,
                                        solutions: solutions);
                                  },
                                ));
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        snapshot.data!.docs[index]['imageUrl']),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(snapshot.data!.docs[index]['name']),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        homeController.index.value = 4;
                      },
                      child: Card(
                        color: Colors.yellow.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Need Help ?",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "Contact a Aggriculture Expert to solve your problems."),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.arrow_forward))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 320.0,
                            child: StreamBuilder<dynamic>(
                              stream: FirebaseFirestore.instance
                                  .collection("rentmachine")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: Column(
                                    children: const [
                                      CircularProgressIndicator(),
                                      Text("Loading")
                                    ],
                                  ));
                                }
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //     FullRentScreen(
                                        //   url: snapshot.data.docs[index]
                                        //       ['url'],
                                        //   address: snapshot.data
                                        //       .docs[index]['address'],
                                        //   day: snapshot.data.docs[index]
                                        //       ['day'],
                                        //   Description: snapshot.data
                                        //       .docs[index]['description'],
                                        //   machinename: snapshot
                                        //       .data.docs[index]['name'],
                                        //   price: snapshot.data.docs[index]
                                        //       ['price'],
                                        //   phone: snapshot.data.docs[index]
                                        //       ['phone'],
                                        //   sellername: snapshot.data
                                        //       .docs[index]['sellername'],
                                        // ),
                                        // )
                                        // );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          // height: 200,
                                          width: 300,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xfff6f8f9),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          8.0),
                                                              child: Text(snapshot
                                                                          .data
                                                                          .docs[
                                                                      index]
                                                                  ['name']),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          8.0),
                                                              child: Text(
                                                                  '5 ours Ago',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                            ),
                                                          ]),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.network(snapshot
                                                    .data.docs[index]['url']),
                                              ),
                                              const SizedBox(height: 9),
                                              Row(
                                                children: [
                                                  const CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        'https://firebasestorage.googleapis.com/v0/b/hackathon-128d9.appspot.com/o/rentmachine%2Fcombine.jpg?alt=media&token=43684db6-6c65-4833-aa2d-ef9a9e999bb7'),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Price :${snapshot.data.docs[index]['price']}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child: Text(
                                                                  "Day : ${snapshot.data.docs[index]['day']} ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ]),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                  'Seller Name : ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(snapshot.data
                                                                          .docs[
                                                                      index][
                                                                  'sellername']),
                                                            ]),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Average Agriculture Growth:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 190,
                          height: 190,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: SfCartesianChart(
                                title: ChartTitle(
                                    text: "Crops",
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.underline)),
                                primaryXAxis: DateTimeAxis(),
                                series: [
                                  LineSeries(
                                    markerSettings:
                                        MarkerSettings(isVisible: true),
                                    dataSource: homeController.chartData,
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
                          ),
                        ),
                        SizedBox(
                          height: 190,
                          width: 190,
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  // width: 200,
                                  height: 60,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Crops: 34%"),
                                          Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  // width: 200,
                                  height: 60,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Vegetables: -10%"),
                                          Icon(
                                            Icons.arrow_downward,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  // width: 200,
                                  height: 60,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Fruits: 15%"),
                                          Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 190,
                          height: 190,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: SfCartesianChart(
                                title: ChartTitle(
                                    text: "Vegetables",
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.underline)),
                                primaryXAxis: DateTimeAxis(),
                                series: [
                                  LineSeries(
                                    markerSettings:
                                        MarkerSettings(isVisible: true),
                                    dataSource: homeController.chartData,
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
                          ),
                        ),
                        SizedBox(
                          width: 190,
                          height: 190,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: SfCartesianChart(
                                title: ChartTitle(
                                    text: "Fruits",
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.underline)),
                                primaryXAxis: DateTimeAxis(),
                                series: [
                                  LineSeries(
                                    markerSettings:
                                        MarkerSettings(isVisible: true),
                                    dataSource: homeController.chartData,
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
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
