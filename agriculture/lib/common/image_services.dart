import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

class ImageService extends ChangeNotifier{
  Future<Uint8List?> getimage() async {
    FilePickerResult? pickedImage =
    await FilePicker.platform.pickFiles(type: FileType.image);
    notifyListeners();
    if (pickedImage != null) {
      if (kIsWeb) {
        return pickedImage.files.single.bytes;
      }
      return await File(pickedImage.files.single.path!).readAsBytes();
    }
    return null;

  }
  Future<String> uploadImageToStorage(context,Uint8List file) async {

  // String uuid;
    Reference ref = FirebaseStorage.instance.ref('rentmachine').child(DateTime.now().toString());
    UploadTask uploadTask =
    ref.putData(file, SettableMetadata(contentType: 'image/jpg'));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    if (snapshot.state == TaskState.success) {
      // Navigator.pop(context);
     print("Nice !"+ "Your Image has been sent Succesfully");
     print("url is"+downloadUrl.toString());
    }
    notifyListeners();
    return downloadUrl;
  }

}
final imageserviceprovider=ChangeNotifierProvider.autoDispose((ref) {
  var state=ImageService();
  return state;
}

);