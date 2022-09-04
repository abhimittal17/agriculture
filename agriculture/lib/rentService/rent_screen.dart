import 'package:agriculture/rentService/view_all_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'full_rent_screen.dart';

class RentScreen extends StatelessWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rent machine ")),
      body:SingleChildScrollView(child:  Column(
        children: [
          const SizedBox(height: 10.0,),
          SizedBox(height: 30.0,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("MACHINE ON RENT",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ViewAllScreen() ,));
              }, child: const Text("View All >")),
            )
          ],)),
          SizedBox(height: 400.0,child: StreamBuilder<dynamic>(
            stream: FirebaseFirestore.instance.collection("rentmachine").snapshots(),
            builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading")
                ],
              ));
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FullRentScreen(
                        url: snapshot.data.docs[index]['url'],address: snapshot.data.docs[index]['address'],day: snapshot.data.docs[index]['day'],Description: snapshot.data.docs[index]['description'],machinename: snapshot.data.docs[index]['name'],price: snapshot.data.docs[index]['price'],phone: snapshot.data.docs[index]['phone'],sellername: snapshot.data.docs[index]['sellername'],),));
                  },
                  child: Container(
                    height: 400,
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xfff6f8f9),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(snapshot.data.docs[index]['name']),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text('5 ours Ago', style: const TextStyle(color: Colors.grey)),
                                      ),
                                    ]),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(snapshot.data.docs[index]['url']
                              ),
                        ),
                        const SizedBox(height: 9),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/hackathon-128d9.appspot.com/o/rentmachine%2Fcombine.jpg?alt=media&token=43684db6-6c65-4833-aa2d-ef9a9e999bb7'),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text('Price :${snapshot.data.docs[index]['price']}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "Day : ${snapshot.data.docs[index]['day']} ",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:  [
                                        const Text('Seller Name : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(snapshot.data.docs[index]['sellername']),
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },),),


        ],
      ),),

    );
  }
}
