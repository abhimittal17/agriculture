import 'package:agriculture/controllers/home_controller.dart';
import 'package:agriculture/weather_widget.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            WeatherWidget(),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Average Agriculture Growth:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
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
                            markerSettings: MarkerSettings(isVisible: true),
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        width: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        width: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
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
                            markerSettings: MarkerSettings(isVisible: true),
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
                  width: 200,
                  height: 200,
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
                            markerSettings: MarkerSettings(isVisible: true),
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
        ),
      ),
    );
  }
}
