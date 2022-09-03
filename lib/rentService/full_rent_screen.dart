import 'package:flutter/material.dart';

class FullRentScreen extends StatelessWidget {
  String url;
  String machinename;
  String sellername;
  String day;
  String price;
  String Description;
  String address;
  String phone;

  FullRentScreen(
      {Key? key,
      required this.url,
      required this.machinename,
      required this.phone,
      required this.address,
      required this.day,
      required this.Description,
      required this.price,
      required this.sellername})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Full Detail Screen")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(url),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 8.0,
                      ),
                      child: Text(
                        "Machine : $machinename",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Address : $address",
                          style: const TextStyle(color: Color(0xff12A278))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Hosted by",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Price : " + price + "/-",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Days : " + day,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(url),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                sellername,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text("Description :"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                      child: Text(Description),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Pay & Join Event'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
