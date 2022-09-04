import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/image_services.dart';

class EventAdd extends ConsumerWidget {
  EventAdd({Key? key}) : super(key: key);

  TextEditingController machinecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
String url='';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(imageserviceprovider);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add Machine for Rent'),
          backgroundColor: Color(0xff12A278)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            var file=await provider.getimage();
                           url= await provider.uploadImageToStorage(context, file!);

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 60),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                                child: Text('Select Machine image  ')),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: machinecontroller,
                          decoration: InputDecoration(
                            hintText: "Enter Machine Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Machine Name is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: addresscontroller,
                          decoration: InputDecoration(
                            hintText: "Enter Address ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: descriptioncontroller,
                          decoration: InputDecoration(
                            hintText: "write Description about Machine",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: pricecontroller,
                                decoration: InputDecoration(
                                  hintText: "Rent Price",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Rent Price is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: daycontroller,
                                decoration: InputDecoration(
                                  hintText: "Days of Rent",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Days are required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async{
                        if(url.isEmpty){
                          print("please select image");
                        }else{
                        await FirebaseFirestore.instance.collection("reqrentmachine").doc().set({
                          "phone":"1112223333",
                          "address":addresscontroller.text,
                          "description":descriptioncontroller.text,
                          "url":url,
                          "name":machinecontroller.text,
                          "sellername":"harry",
                          "price":pricecontroller.text,
                          "days":daycontroller.text
                        });}
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff12A278)),
                      child: const Text("Add Machine for Rent"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
