import 'dart:convert';

import 'package:agriculture/authServices/login/login.dart';
import 'package:agriculture/authServices/login/newfile.dart';
import 'package:agriculture/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class Auth extends ChangeNotifier {
  // var ip = "192.168.196.225";
  var userdata;

  Future login(context, phone, password) async {
    try {
      var response = await Dio(BaseOptions(responseType: ResponseType.plain)).post(
          "${Constant.url}loginClass.php",
          data: {"phone": phone, "password": password});
      print(response.data);

      userdata = json.decode(response.data);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(userdata['message'].toString())));
      print(userdata['username']);
      if (userdata['message'] == "Successful") {
          print("success");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>const MyHomePage()),
              (route) => false);

      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future register(context, phone, username, password) async {
    try {
      var response = await Dio(BaseOptions(responseType: ResponseType.plain))
          .post("${Constant.url}signup.php", data: {
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
              MaterialPageRoute(builder: (context) => const MyHomePage()),
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

final authprovider = ChangeNotifierProvider((ref) {
  var state = Auth();
  return state;
});
