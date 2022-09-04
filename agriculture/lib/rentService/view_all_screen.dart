import 'package:agriculture/rentService/event_add.dart';
import 'package:agriculture/rentService/full_rent_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  ViewAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(backgroundColor: Color(0xff12A278)),
        body: StreamBuilder<dynamic>(
          stream:
              FirebaseFirestore.instance.collection("rentmachine").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(children: const [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ]),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullRentScreen(
                              url: snapshot.data.docs[index]['url'],
                              machinename: snapshot.data.docs[index]['name'],
                              phone: snapshot.data.docs[index]['phone'],
                              address: snapshot.data.docs[index]['address'],
                              day: snapshot.data.docs[index]['day'],
                              Description: snapshot.data.docs[index]
                                  ['description'],
                              price: snapshot.data.docs[index]['price'],
                              sellername: snapshot.data.docs[index]['name']),
                        ));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(snapshot.data.docs[index]['url']),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      snapshot.data.docs[index]['name'],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    '5 hours ago',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Text(
                                    'Location : ${snapshot.data.docs[index]['address']}',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  const SizedBox(width: 16),
                                ],
                              ),
                              const SizedBox(height: 1),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price : ${snapshot.data.docs[index]['price']}/-",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 85.0),
                                      child: Text(
                                        "Day : ${snapshot.data.docs[index]['day']}",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventAdd(),
                ));
          },
          backgroundColor: Color(0xff12A278),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
