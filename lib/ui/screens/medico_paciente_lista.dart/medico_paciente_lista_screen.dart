import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/ui/screens/medico_paciente_lista.dart/medico_paciente_lista_controller.dart';

class MedicoPacienteListaScreen extends StatelessWidget {
  const MedicoPacienteListaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicoPacienteListaController());

    return GetBuilder<MedicoPacienteListaController>(builder: (controller) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Pacientes'),
            ),
        body: const Center(
          child: Text('MedicoPacienteListaScreen'),
        ),
      );
    });
  }
}
