import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/data/providers/medico_provider.dart';
import 'package:glucoadmin/domain/models.dart';

class MedicoEditarController extends GetxController {
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
  TextEditingController password = TextEditingController();

  Future<bool> editarMedico(String idMedico) async {
    try {
      var newMedico = MedicoModel(
          // id: idMedico
          nombre: nombre.text,
          apellidos: apellidos.text,
          numero: numero.text,
          correo: correo.text,
          dni: dni.text,
          numeroCpi: numeroCpi.text,
        //   fecha: nacimiento,
          especialidad: especialidad.text,
          experiencia: experiencia.text);
      cargando(true);
      // newMedico.setId(idMedico);

      //   return true;
      var respuesta = await medicoProvider.editarMedico(newMedico, idMedico);
      if (respuesta == true) {
        nombre.text = newMedico.nombre;
        apellidos.text = newMedico.apellidos;
        numero.text = newMedico.numero;
        especialidad.text = newMedico.especialidad;
        // print(especialidad.text);
        experiencia.text = newMedico.experiencia;
      }
      cargando(false);

      return respuesta;
    } catch (e) {
      return false;
    }
  }

  rellenarData(MedicoModel model) {
    nombre.text = model.nombre;
    apellidos.text = model.apellidos;
    numero.text = model.numero;
    correo.text = model.correo;
    dni.text = model.dni;
    numeroCpi.text = model.numeroCpi;
    especialidad.text = model.especialidad;
    experiencia.text = model.experiencia;

    update();
  }

  cargando(bool value) {
    print(especialidad.text);
    isLoading = value;
    update(['controllerButton']);
  }
}
