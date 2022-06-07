import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/data/providers/medico_provider.dart';
import 'package:glucoadmin/domain/models.dart';

class MedicoListaController extends GetxController {
  final medicoProvider = Get.find<MedicoProvider>();

  Future<QuerySnapshot<Object?>> listarMedicos() async {
    var lista = await medicoProvider.listarMedicos();
    return lista;
  }

  Future<bool> cambiarEstadoMedico(MedicoModel medico) async {
    var respuesta = await medicoProvider.cambiarEstadoMedico(medico);
    print('cambiarEstadoMedico $respuesta');
    // update();
    return respuesta;
  }
}
