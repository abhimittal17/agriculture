import 'dart:convert';

import 'package:agriculture/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  var ip = "192.168.196.225";
  var userdata;
  Future login(context, phone, password) async {
    try {
      var response = await Dio(BaseOptions(responseType: ResponseType.plain))
          .post("http://$ip/pcbtproject/loginClass.php",
              data: {"phone": phone, "password": password});
      print(response.statusCode);
      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var pref = SharedPreferences.getInstance();

        // print(response);
        userdata = jsonDecode(response.data);
        sharedPreferences.setString('phone', userdata['phone']);
        sharedPreferences.setString('username', userdata['username']);

        print(userdata['username']);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(userdata['message'].toString())));
        if (userdata['message'] == "Successful") {
          print("success");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false);
        }
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
      userdata = jsonDecode(response.data);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(userdata['message'].toString())));
      if (response.statusCode == 200) {
        print(userdata);
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
