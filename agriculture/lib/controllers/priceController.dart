import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PriceController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>>? snapshot;
  getPrices(String cropName) async {
    snapshot = await FirebaseFirestore.instance
        .collection('crops')
        .doc(cropName)
        .collection('prices')
        .snapshots();
  }

  List<PriceData> chartData = [
    // PriceData(DateTime(2016), 25),
    // PriceData(DateTime(2017), 35),
    PriceData(DateTime(2015), 25),
    PriceData(DateTime(2016), 15),
    PriceData(DateTime(2017), 115),
    PriceData(DateTime(2018), 65),
    PriceData(DateTime(2019), 65),
    PriceData(DateTime(2020), 65),
    PriceData(DateTime(2021), 65),
  ];
}

class PriceData {
  PriceData(this.year, this.price);
  final DateTime year;
  final int price;
}
