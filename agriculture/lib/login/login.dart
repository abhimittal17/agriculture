import 'package:agriculture/login/forgot.dart';
import 'package:agriculture/login/registration.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.green.shade300,
      body: Container(


        child:Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(

                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  SizedBox(height:100,child: Image.asset("assets/images/logo.png")),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Sign In To Your Account",
                    style: TextStyle(
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
                    height: 30,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){},

                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(340, 40),
                              backgroundColor: Color(0xff12A278),
                              textStyle: const TextStyle(
                                  color:Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          child:Text("Sign In",style: TextStyle(color:Colors.white,),)),


                    ],
                  ),

                  Row(


                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (

                            ) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyRegister())); },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyForgot()));
                          },
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ))
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
