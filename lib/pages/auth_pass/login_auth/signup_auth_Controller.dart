import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController{

static SignUpController get instance => Get.find();

final fullname = TextEditingController();
final email = TextEditingController();
final phoneNo = TextEditingController();
final pass = TextEditingController();
final confirmpass = TextEditingController();

void registerUser(String email, String password){

}

}