import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoadmin/data/providers/autentificacion_provider.dart';

class LoginController extends GetxController {
  final autentificacionProvider = Get.find<AutentificacionProvider>();
  bool isLoading = false;

  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginController();

  Future<bool> login() async {
    cargando(true);
    var isOk = await autentificacionProvider.login(correo.text, password.text);
    if (isOk == true) {
      var storage = GetStorage();
      var usuarioTipo = 'admin';
      storage.write('isLogued', true);
      storage.write('usuarioTipo', usuarioTipo);
    }

    cargando(false);
    return isOk;
  }

  alerta(String texto, message) {
    Get.snackbar(texto, message);
  }

  cargando(bool value) {
    isLoading = value;
    update();
  }
}
