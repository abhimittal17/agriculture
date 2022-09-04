import 'dart:convert';

import 'package:agriculture/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Auth extends ChangeNotifier {
  var ip = "192.168.196.225";

  Future login(context, phone, password) async {
    try {
      var response = await Dio(BaseOptions(responseType: ResponseType.plain))
          .post("http://$ip/pcbtproject/loginClass.php",
              data: {"phone": phone, "password": password});
      print(response.statusCode);
      if (response.statusCode == 200) {
        // print(response);
        var userdata = jsonDecode(response.data);
        if (userdata['message'] == "Successful") {
          print("success");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false);
        }

        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future register(context, phone, username, password) async {
    try {
      var response = await Dio(BaseOptions(responseType: ResponseType.plain))
          .post("http://$ip/pcbtproject/signup.php", data: {
        "phone": phone,
        "username": username,
        "password": password
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var userdata = jsonDecode(response.data);
        if (userdata['message'] == "Successful") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false);
        }
        print(response);

        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}

final authprovider = ChangeNotifierProvider.autoDispose((ref) {
  var state = Auth();
  return state;
});
