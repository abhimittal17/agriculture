import 'package:agriculture/authServices/login/login.dart';
import 'package:agriculture/controllers/edit_controller.dart';
import 'package:agriculture/home_screen.dart';
import 'package:agriculture/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Permission.location.request();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//     checkLogin() async {
// //      SharedPreferences pref=await SharedPreferences.getInstance();
// //     if(pref.getString('username')!.isEmpty){
// // return false;
// //     }else{
// //       return true;
// //     }
//     }
    EditController editController = Get.put(EditController());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agriculture',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.green.shade50,
          primarySwatch: Colors.green,
        ),
        home: Splash());
  }
}
