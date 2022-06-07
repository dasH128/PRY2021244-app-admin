import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoadmin/ui/screens/loading/loading_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoadingController());

    _validarTipoUsuario(context);
    return GetBuilder<LoadingController>(builder: (controller) {
      //   controller.validarLogin(context);
      return Scaffold(
        // body: (controller.isLogued == true ) ? _loadingView() : _loginView(context),
        body: _loadingView(),
      );
    });
  }

  Widget _loadingView() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [CircularProgressIndicator(), Text('Cargando ..')],
      ),
    );
  }

  Widget _loginView(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            const Text(
              'GlucoMed',
              style: TextStyle(
                  fontSize: 52.0,
                  color: AppTheme.primary,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w800),
            ),
            const Text(
              'inicia tu monitoreo',
              style: AppTheme.textEtiquetaTituloStlyle,
            ),
            Container(height: 390),
            SizedBox(
              //   color: Colors.red,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 42,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: const Text('Iniciar Sesión'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _validarTipoUsuario(BuildContext context) async {
    Timer(const Duration(seconds: 2), () async {
      var storage = GetStorage();
      var isExist = storage.read<bool>('isLogued');
      print('isExist $isExist');
      if (isExist == true) {
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        Navigator.pushReplacementNamed(context, 'inicio');
      }
    });
  }
}
