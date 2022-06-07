import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoadingController extends GetxController {
  bool isLogued = false;

  LoadingController() {
    // validarLogin();
  }

//   Future<bool> validarLogin(BuildContext context) async {
//     Timer(Duration(seconds: 2), () async {

//     });
//     var storage = GetStorage();
//     var isExist = storage.read<bool>('isLogued');
//     if (isExist == true) {
//       isLogued = true;
//       update();
//       print('usuario esxite');
//       Navigator.pushReplacementNamed(context, 'home');
//       return true;
//     }

//     print('usuario no esxite');
//     Navigator.pushReplacementNamed(context, 'inicio');
//     return false;
//   }
}
