// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/data/providers/medico_provider.dart';
import 'package:glucoadmin/domain/models.dart';

class MedicoRegistroController extends GetxController {
  final medicoProvider = Get.find<MedicoProvider>();
  bool isLoading = false;

  TextEditingController nombre = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController dni = TextEditingController();
  TextEditingController numeroCpi = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController especialidad = TextEditingController();
  TextEditingController experiencia = TextEditingController();
  TextEditingController correo = TextEditingController();
//   TextEditingController password = TextEditingController();

  Future<bool> registrarMedico() async {
    try {
      cargando(true);

      String isCreatedId =
          await medicoProvider.crearCuentaMedico(correo.text, dni.text);
      print('is cretedId $isCreatedId  >');
      print(isCreatedId.isEmpty);

      if (isCreatedId.isEmpty) {
        cargando(false);
        return false;
      }

      DateTime nacimiento = DateTime.now();
      var newMedico = MedicoModel(
          id: isCreatedId,
          nombre: nombre.text,
          apellidos: apellidos.text,
          numero: numero.text,
          correo: correo.text,
          dni: dni.text,
          numeroCpi: numeroCpi.text,
          // fecha: nacimiento,
          especialidad: especialidad.text,
          experiencia: experiencia.text);
      newMedico.setId(isCreatedId);
      bool isOk = await medicoProvider.registrar(newMedico);
      cargando(false);
      return isOk;
    } catch (e) {
      cargando(false);
      return false;
    }
  }

  bool validarCampos() {
    if (nombre.value.text.isEmpty ||
        apellidos.value.text.isEmpty ||
        numero.value.text.isEmpty ||
        correo.value.text.isEmpty ||
        dni.value.text.isEmpty ||
        numeroCpi.value.text.isEmpty ||
        especialidad.value.text.isEmpty ||
        experiencia.value.text.isEmpty) {
      Get.snackbar('Registro', 'Porfavor revisar y completar todos los campos');
      return false;
    }

    if ((nombre.value.text.length < 3) ||
        (apellidos.value.text.length < 3) ||
        (numero.value.text.length != 9) ||
        (dni.value.text.length != 8) ||
        (numeroCpi.value.text.length != 6) ||
        (especialidad.value.text.length < 3)) {
      Get.snackbar('Registro', 'Porfavor completar correctamente');
      return false;
    }

    return true;
  }

  limpiarCampos() {
    nombre.text = '';
    apellidos.text = '';
    numero.text = '';
    dni.text = '';
    numeroCpi.text = '';
    especialidad.text = '';
    experiencia.text = '';
    correo.text = '';
  }

  cargando(bool value) {
    isLoading = value;
    update();
  }
}
