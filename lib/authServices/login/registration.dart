import 'package:agriculture/authServices/auth_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login.dart';

class MyRegister extends ConsumerWidget {
   MyRegister({Key? key}) : super(key: key);
  TextEditingController phoncontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isregister=false;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final provider=ref.watch(authprovider);
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
                        child: Image.asset("assets/images/alogo.jpeg")),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Sign Up To Your Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Username ',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoncontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'phone no ',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'phone no is required';
                        }
                        if (text.length<10) {
                          return 'Enter correct phone No';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
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
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isregister ?CircularProgressIndicator() :
                        ElevatedButton(
                            onPressed: ()async {
                              if(globalKey.currentState!.validate()){
                                isregister=true;
                                print("validate");
                              await provider.register(context,phoncontroller.text, namecontroller.text, passwordcontroller.text);
                              isregister=false;
                              }
                              else{
                                print("not valid");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * .81,
                                    MediaQuery.of(context).size.height * .05),
                                // backgroundColor: Color(0xff12A278),
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        // textDirection: TextDirection.rtl,
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
                          //         builder: (context) =>  MyLogin()));
                          //   },
                          //   child: const Text(
                          //     "Sign In",
                          //     style: TextStyle(
                          //       fontSize: 18,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    )
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
