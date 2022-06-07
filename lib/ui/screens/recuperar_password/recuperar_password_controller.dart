import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecuperarPasswordController extends GetxController {
  bool firstPage = true;

  TextEditingController correo = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  irPagina(int page) {

    if (page == 1) {
      firstPage = true;
    }

    if (page == 2) {
      firstPage = false;
    }
    update();
  }

  recuperarPassword(){}
}
