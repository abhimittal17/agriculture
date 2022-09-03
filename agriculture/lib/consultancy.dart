import 'package:agriculture/consultant_info.dart';
import 'package:flutter/material.dart';

class Consultancy extends StatefulWidget {
  const Consultancy({super.key});

  @override
  State<Consultancy> createState() => _ConsultancyState();
}

class _ConsultancyState extends State<Consultancy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Consultants')),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          card(
              "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              "Abhi Mittal",
              "Professor at PAU",
              context),
          card(
              "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              "Pardeep Singh",
              "Professor at PAU",
              context),
          card(
              "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29tZW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
              "Kulddep Kaur",
              "Professor at PAU",
              context),
          card(
              "https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              "Hardeep Singh",
              "Professor at PAU",
              context),
          card(
              "https://images.unsplash.com/photo-1588516903720-8ceb67f9ef84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHdvbWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              "Satwinder Kaur",
              "Professor at PAU",
              context),
        ],
      ),
    );
  }
}

Widget card(String imgpath, String name, String post, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imgpath),
              radius: 30,
            ),
            title: Text("$name",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start),
            subtitle: Text('$post'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Consultant_info(
                              name: name,
                              imgpath: imgpath,
                              post: post,
                            )));
              },
              child: Icon(
                Icons.video_call,
                size: 30,
              ),
            ),
          ),
        )),
  );
}
