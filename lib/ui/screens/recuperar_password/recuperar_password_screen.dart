import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/ui/screens/recuperar_password/recuperar_password_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';

class RecuperarPasswordScreen extends StatelessWidget {
  const RecuperarPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RecuperarPasswordController());
    return GetBuilder<RecuperarPasswordController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: (controller.firstPage == true)
                ? _fisrtPage(context, controller)
                : _secondPage(context, controller),
          ),
        ),
      );
    });
  }

  Widget _fisrtPage(
      BuildContext context, RecuperarPasswordController controller) {
    return Column(
      children: [
        const Text(
          'Ingresa el correo electrónico con el que te registrastes',
          style: AppTheme.textEtiquetaTituloStlyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 45,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.correo,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Usuario'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              // Navigator.pushReplacementNamed(context, 'inicio_paciente');
              controller.irPagina(2);
            },
            child: const Text('Continuar', style: AppTheme.textBtnStlyle),
          ),
        ),
      ],
    );
  }

  Widget _secondPage(
      BuildContext context, RecuperarPasswordController controller) {
    return Column(
      children: [
        const Text(
          'Inserta tu nueva contraseña',
          style: AppTheme.textEtiquetaTituloStlyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 45,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.password,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Contraseña'),
          ),
        ),
        SizedBox(
          height: 45,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.newPassword,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Confirma contraseña'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              controller.recuperarPassword();
              Navigator.pushReplacementNamed(context, 'login');
            },
            child: const Text('Continuar', style: AppTheme.textBtnStlyle),
          ),
        ),
      ],
    );
  }
}
