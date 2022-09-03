import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';

class WeatherController extends GetxController {
  String key = "1f1e6615391ad90fb960347aeb810176";
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;
  RxMap weatherMap = {}.obs;
  getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    lat.value = position.latitude;
    lon.value = position.longitude;
  }

  WeatherFactory wf = WeatherFactory("1f1e6615391ad90fb960347aeb810176");
  getCurrentWeather() async {
    getCurrentPosition();
    Weather w = await wf.currentWeatherByLocation(lat.value, lon.value);

    weatherMap.addAll({
      'weather': w.weatherMain,
      'city': w.areaName,
      'icon': "http://openweathermap.org/img/w/${w.weatherIcon}.png",
      'temp': w.temperature,
      'wind': w.windSpeed,
      'time': w.date,
      'maxTemp': w.tempMax,
      'minTemp': w.tempMin
    });
    // print(weatherMap);
  }
}
