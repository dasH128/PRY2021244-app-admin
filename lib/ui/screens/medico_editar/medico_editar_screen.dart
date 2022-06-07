import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/domain/medico_model.dart';
import 'package:glucoadmin/ui/screens/medico_editar/medico_editar_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';
import 'package:glucoadmin/ui/utils/display_dialog_android.dart';
import 'package:glucoadmin/ui/widgets/widgets.dart';

class MedicoEditarScreen extends StatelessWidget {
  const MedicoEditarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicoEditarController());
    MedicoModel medicoModel =
        ModalRoute.of(context)?.settings.arguments as MedicoModel;

    return GetBuilder<MedicoEditarController>(builder: (controller) {
      controller.rellenarData(medicoModel);
      double heightDivision = 8;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Médico'),
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
                SizedBox(height: heightDivision),
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
                SizedBox(height: heightDivision),
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
                SizedBox(height: heightDivision),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.correo,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Correo'),
                  ),
                ),
                SizedBox(height: heightDivision),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    controller: controller.dni,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Dni'),
                  ),
                ),
                SizedBox(height: heightDivision),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    controller: controller.numeroCpi,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Numero CPI'),
                  ),
                ),
                SizedBox(height: heightDivision),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    enabled: false,
                    controller: controller.fecha,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Fecha'),
                  ),
                ),
                SizedBox(height: heightDivision),
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
                SizedBox(height: heightDivision),
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
                SizedBox(height: heightDivision),
                SizedBox(
                  height: AppTheme.heightInputs,
                  width: double.infinity,
                  child: _crearBotonRegistrar(
                      context, controller, medicoModel.id!),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _crearBotonRegistrar(BuildContext context,
      MedicoEditarController controller, String idMedico) {
    return GetBuilder<MedicoEditarController>(
      id: 'controllerButton',
      builder: (controll2) {
          if (controller.isLoading == true) {
            return const CustomLoadingButton();
          } else {
            return ElevatedButton(
              onPressed: () async {
                //   bool validacion = controller.validarCampos();
                //   if (validacion == false) {
                //     return;
                //   }

                bool respuesta = await controll2.editarMedico(idMedico);
                if (respuesta == true) {
                  await displayDialogAndroid(
                      context,
                      '',
                      'Se actualizo exitosamente al médico',
                      Icons.check_circle_outline);
                } else {
                  await displayDialogAndroid(
                      context,
                      '',
                      'No se actualizo al médico, intentelo otra vez',
                      Icons.highlight_off_outlined);
                }
              },
              child:
                  const Text('Guardar Cambios', style: AppTheme.textBtnStlyle),
            );
          }
      }
    );
    // if (controller.isLoading == true) {
    //   return const CustomLoadingButton();
    // } else {
    //   return ElevatedButton(
    //     onPressed: () async {
    //       //   bool validacion = controller.validarCampos();
    //       //   if (validacion == false) {
    //       //     return;
    //       //   }

    //       bool respuesta = await controller.editarMedico(idMedico);
    //       if (respuesta == true) {
    //         await displayDialogAndroid(
    //             context,
    //             '',
    //             'Se actualizo exitosamente al médico',
    //             Icons.check_circle_outline);
    //       } else {
    //         await displayDialogAndroid(
    //             context,
    //             '',
    //             'No se actualizo al médico, intentelo otra vez',
    //             Icons.highlight_off_outlined);
    //       }
    //     },
    //     child: const Text('Guardar Cambios', style: AppTheme.textBtnStlyle),
    //   );
    // }
  }
}
