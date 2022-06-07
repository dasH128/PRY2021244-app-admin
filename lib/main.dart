import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoadmin/data/providers/autentificacion_provider.dart';
import 'package:glucoadmin/data/providers/medico_provider.dart';
import 'package:glucoadmin/ui/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();

  
  Get.lazyPut(() => AutentificacionProvider());
  Get.lazyPut(() => MedicoProvider());

  runApp(const MyApp());
}
