// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agriculture/videocall.dart';
import 'package:flutter/material.dart';

class Consultant_info extends StatefulWidget {
  String name;
  String imgpath;
  String post;
  Consultant_info({
    Key? key,
    required this.name,
    required this.imgpath,
    required this.post,
  }) : super(key: key);

  @override
  State<Consultant_info> createState() => _Consultant_infoState();
}

class _Consultant_infoState extends State<Consultant_info> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Profile")),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildtop(widget.imgpath),
            buildContent(widget.name, widget.post),
          ],
        ));
  }

  Widget buildContent(String name, String post) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        Text(
          post,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(
          height: 16,
        ),
        const ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
          subtitle: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoCallScreen()));
              },
              label: const Text("Video Call"),
              icon: const Icon(
                Icons.video_call,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildtop(String imgpath) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage(imgpath)),
          Positioned(top: top, child: buildProfileImage(imgpath)),
        ]);
  }

  Widget buildCoverImage(String imgpath) => Container(
        color: Colors.grey,
        child: Image.network(imgpath,
            width: double.infinity, height: coverHeight, fit: BoxFit.cover),
      );
  Widget buildProfileImage(String imgpath) => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(imgpath),
      );
}
