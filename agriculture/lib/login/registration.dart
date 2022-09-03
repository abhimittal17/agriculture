import 'package:agriculture/login/login.dart';
import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
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
                    "Sign Up To Your Account",
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
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
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
                          child:Text("Sign Up",style: TextStyle(color:Colors.white,),)),


                    ],
                  ),

                  Row(


                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyLogin())); },


                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
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

