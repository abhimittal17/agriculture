import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  changePage(int val) {
    index.value = val;
  }

  List<PriceData> chartData = [
    // PriceData(DateTime(2016), 25),
    // PriceData(DateTime(2017), 35),
    PriceData(DateTime(2018), 45),
    PriceData(DateTime(2019), 15),
    PriceData(DateTime(2020), 115),
    PriceData(DateTime(2021), 65),
  ];
}

class PriceData {
  PriceData(this.year, this.price);
  final DateTime year;
  final int price;
}
