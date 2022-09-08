import 'package:agriculture/authServices/auth_provider.dart';
import 'package:agriculture/authServices/login/login.dart';
import 'package:agriculture/controllers/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends ConsumerWidget {
  Edit({Key? key}) : super(key: key);
  EditController editController = Get.put(EditController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authprovider);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.userdata['username']),
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // elevation: 1,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   color: Colors.green,
          //   onPressed: () {},
          // ),
          ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/wheat.jpg"))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              buildTextFeild("Full Name", provider.userdata["username"], false),
              const SizedBox(
                height: 40,
              ),
              buildTextFeild("Phone Name", provider.userdata['phone'], false),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 170,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {},
                        child: const Text("CANCEL",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.green,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {},
                          child: const Text("SAVE",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  letterSpacing: 2.2)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MyLogin()),
                      (route) => false);
                },
                child: const Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 14, color: Colors.red, letterSpacing: 2.2)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextFeild(
      String labelText, String placeholder, bool isPasswordTextField) {
    return TextField(
      obscureText:
          isPasswordTextField ? editController.showPassword.value : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {
                  editController.showPassword.value =
                      !editController.showPassword.value;
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
