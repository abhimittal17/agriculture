import 'package:agriculture/authServices/login/login.dart';
import 'package:agriculture/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agriculture',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green.shade50,
        primarySwatch: Colors.green,
      ),
      home: MyLogin(),
    );
  }
}
