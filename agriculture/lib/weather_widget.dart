import 'package:agriculture/controllers/weather_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class WeatherWidget extends StatefulWidget {
  WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  WeatherController weatherController = Get.put(WeatherController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherController.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => weatherController.weatherMap.isEmpty
        ? SizedBox(
            child: Shimmer.fromColors(
                child: SizedBox(height: 110, child: Card()),
                baseColor: Colors.grey,
                highlightColor: Colors.green),
          )
        : SizedBox(
            height: 110,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                ),
                                Text(
                                    weatherController.weatherMap['city'] ?? ''),
                              ],
                            ),
                            weatherController.weatherMap['time']
                                    .toString()
                                    .isEmpty
                                ? Text("")
                                : Text(weatherController.weatherMap['time']
                                    .toString()
                                    .substring(11, 16))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              weatherController.weatherMap['temp']
                                      .toString()
                                      .isEmpty
                                  ? Text("")
                                  : Text(
                                      weatherController.weatherMap['temp']
                                          .toString()
                                          .substring(0, 6),
                                      style: TextStyle(fontSize: 26),
                                    ),
                              Text(
                                weatherController.weatherMap['weather'] ?? '',
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                children: [
                                  weatherController.weatherMap['maxTemp']
                                          .toString()
                                          .isEmpty
                                      ? Text("")
                                      : Text(
                                          "Day " +
                                              weatherController
                                                  .weatherMap['maxTemp']
                                                  .toString()
                                                  .substring(0, 4) +
                                              "°  ",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                  weatherController.weatherMap['minTemp']
                                          .toString()
                                          .isEmpty
                                      ? Text("")
                                      : Text(
                                          "-  Night " +
                                              weatherController
                                                  .weatherMap['minTemp']
                                                  .toString()
                                                  .substring(0, 4) +
                                              "°",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                          Image.network(
                            weatherController.weatherMap['icon'] ?? '',
                            height: 50,
                          ),
                          // InkWell(
                          //     onTap: () {
                          //       weatherController.getCurrentWeather();
                          //     },
                          //     child: Icon(Icons.refresh))
                        ],
                      ),
                    ),
                  ],
                )),
          ));
  }
}
