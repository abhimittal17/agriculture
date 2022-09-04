import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditController extends GetxController {
  RxBool showPassword = true.obs;
  RxString username = "".obs;
  RxString phone = "".obs;
  getUSerDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username.value = sharedPreferences.getString('username')!;
    phone.value = sharedPreferences.getString('phone')!;
  }
  
}
