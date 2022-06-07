import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  logout() {
    var storage = GetStorage();
    storage.remove('isLogued');
    storage.remove('usuarioTipo');
  }
}
