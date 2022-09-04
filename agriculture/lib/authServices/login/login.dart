import 'package:agriculture/authServices/auth_provider.dart';
import 'package:agriculture/authServices/login/forgot.dart';
import 'package:agriculture/authServices/login/registration.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLogin extends ConsumerWidget {
  MyLogin({Key? key}) : super(key: key);

  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool islogin = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authprovider);
    return Scaffold(
      backgroundColor: const Color(0xff12A278),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    SizedBox(
                        height: 100,
                        child: Image.asset("assets/images/logo.png")),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Sign In To Your Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: phonecontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Phone Number',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Phone no is required';
                        }
                        if (text.length < 10) {
                          return "enter correct phone no";
                        }
                        return null;
                      },
                    ),
                    // TextField(
                    //   controller: phonecontroller,
                    //   decoration: InputDecoration(
                    //     // errorText: phonecontroller.valu ??"phone no required" : "",
                    //       fillColor: Colors.grey.shade100,
                    //       filled: true,
                    //       hintText: "Phone Number",
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10))),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'password ',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password is required';
                        }
                        if (text.length < 6) {
                          return "Min 6 Character required";
                        }
                        return null;
                      },
                    ),
                    // TextField(
                    //   controller: passwordcontroller,
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.grey.shade100,
                    //       filled: true,
                    //       hintText: "Password",
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10))),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        islogin
                            ? Center(child: const CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: () async {
                                  if (globalKey.currentState!.validate()) {
                                    islogin = true;
                                    print("validate");
                                    await provider.login(
                                        context,
                                        phonecontroller.text,
                                        passwordcontroller.text);
                                    islogin = false;
                                  } else {
                                    print("not valid");
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * .81,
                                        MediaQuery.of(context).size.height *
                                            .05),
                                    // backgroundColor: Color(0xff12A278),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.end,
                            // textDirection: TextDirection.rtl,
                            // Whether the text should break at soft line breaks
                            softWrap: true,
                            // The number of font pixels for each logical pixel
                            textScaleFactor: 1,
                            text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MyRegister()));
                                },
                              text: 'Create an Account?',
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
                                  softWrap: true,
                                  textScaleFactor: 1,
                                  text: TextSpan(
                                    text: 'Forget Password? ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyForgot()));
                                      },
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                // TextButton(
                                //   onPressed: () {
                                //     Navigator.of(context).push(MaterialPageRoute(
                                //         builder: (context) =>  MyRegister()));
                                //   },
                                //   child: const Text(
                                //     "Sign Up",
                                //     style: TextStyle(
                                //       fontSize: 18,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                // TextButton(
                                //     onPressed: () {
                                //       Navigator.of(context).push(MaterialPageRoute(
                                //           builder: (context) => const MyForgot()));
                                //     },
                                //     child: const Text(
                                //       "Forgot Password",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //         color: Colors.white,
                                //       ),
                                //     ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
