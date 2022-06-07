import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/ui/screens/medico_registro/medico_registro_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';
import 'package:glucoadmin/ui/utils/display_dialog_android.dart';
import 'package:glucoadmin/ui/widgets/custom_loading_button.dart';

class MedicoRegistroScreen extends StatelessWidget {
  const MedicoRegistroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicoRegistroController());

    return GetBuilder<MedicoRegistroController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Médico'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.nombre,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Nombre'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.apellidos,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Apellidos'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.numero,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Número'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.correo,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Correo'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.dni,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Dni'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.numeroCpi,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Numero CPI'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    controller: controller.fecha,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Fecha'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.especialidad,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Especialidad'),
                  ),
                ),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.experiencia,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Años'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  width: double.infinity,
                  child: _crearBotonRegistrar(context, controller),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _crearBotonRegistrar(
      BuildContext context, MedicoRegistroController controller) {
    if (controller.isLoading == true) {
      return const CustomLoadingButton();
    } else {
      return ElevatedButton(
        onPressed: () async {
          bool validacion = controller.validarCampos();
          if (validacion == false) {
            return;
          }
          
          bool respuesta = await controller.registrarMedico();
          if (respuesta == true) {
            await displayDialogAndroid(
                context,
                '',
                'Se registró exitosamente al médico',
                Icons.check_circle_outline);
          } else {
            await displayDialogAndroid(
                context,
                '',
                'No se registró al médico, intentelo otra vez',
                Icons.highlight_off_outlined);
          }
        },
        child: const Text('Registrar', style: AppTheme.textBtnStlyle),
      );
    }
  }
}
