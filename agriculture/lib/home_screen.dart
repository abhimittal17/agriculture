import 'package:agriculture/consultancy.dart';
import 'package:agriculture/controllers/home_controller.dart';
import 'package:agriculture/crops.dart';
import 'package:agriculture/edit.page.dart';
import 'package:agriculture/home_page.dart';
import 'package:agriculture/mandi_screen.dart';
import 'package:agriculture/rentService/view_all_screen.dart';
import 'package:agriculture/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff40b93c),
        title: Text(
          "Agro Solution",
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Edit(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(child: Text("A")),
              ))
        ],
      ),
      body: Obx(
        () {
          if (homeController.index.value == 0) {
            return HomePage();
            // return Container();
          } else if (homeController.index.value == 1) {
            return MandiScreen();
            // return Center(
            //   child: Text("Mandi"),
            // );
          } else if (homeController.index.value == 2) {
            return ViewAllScreen();
          } else if (homeController.index.value == 3) {
            return Crops();
          } else if (homeController.index.value == 4) {
            return Consultancy();
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) => homeController.changePage(value),
              currentIndex: homeController.index.value,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.price_check), label: "Mandi"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fire_truck), label: "Machine Rental"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.info), label: "About Crops"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera_alt), label: "Consultancy"),
              ])),
    );
  }
}
