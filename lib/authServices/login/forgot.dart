import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class MyForgot extends StatefulWidget {
  const MyForgot({Key? key}) : super(key: key);

  @override
  State<MyForgot> createState() => _MyForgotState();
}

class _MyForgotState extends State<MyForgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: Image.asset("assets/images/alogo.jpeg")),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Forgot Password",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize:  Size(MediaQuery.of(context).size.width*.81, MediaQuery.of(context).size.height*.05),
                              // backgroundColor: Color(0xff12A278),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          child: const Text(
                            "Send",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.end,
                              textDirection: TextDirection.rtl,
                              // Whether the text should break at soft line breaks
                              softWrap: true,
                              // The number of font pixels for each logical pixel
                              textScaleFactor: 1,
                              text:  TextSpan(
                                text: 'Already have an Account? ',
                                style:  TextStyle(fontSize: 15.0),
                                children: <TextSpan>[
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) =>  MyLogin()));
                                        },
                                      text: 'Sign In', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
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
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
