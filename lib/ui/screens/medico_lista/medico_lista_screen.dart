import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/domain/models.dart';
import 'package:glucoadmin/ui/screens/medico_lista/medico_lista_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';
import 'package:glucoadmin/ui/utils/display_dialog_confirm.dart';
import 'package:glucoadmin/ui/widgets/widgets.dart';

class MedicoListaScreen extends StatelessWidget {
  const MedicoListaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicoListaController());

    return GetBuilder<MedicoListaController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Médicos'),
        ),
        body: FutureBuilder<QuerySnapshot<Object?>>(
            future: controller.listarMedicos(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomLoadingPage();
              }
              List<MedicoModel> medicos = [];

              for (var item in snapshot.data!.docs) {
                var elemento = item.data() as Map<String, dynamic>;
                var medicoParse = MedicoModel(
                  nombre: elemento["nombre"],
                  apellidos: elemento["apellidos"],
                  numero: elemento["numero"],
                  dni: elemento["dni"],
                  numeroCpi: elemento["numeroCpi"],
                  especialidad: elemento["especialidad"],
                  experiencia: elemento["experiencia"],
                  estado: elemento["estado"],
                  correo: elemento["correo"],
                );
                medicoParse.setId(elemento["id"]);
                medicos.add(medicoParse);
              }

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView.builder(
                    itemCount: medicos.length,
                    itemBuilder: (context, index) {
                      return _itemCardMedico(
                          controller, context, medicos[index]);
                    }),
              );
            }),
      );
    });
  }

  Widget _itemCardMedico(MedicoListaController controller, BuildContext context,
      MedicoModel medico) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 15,
      shadowColor: AppTheme.primary.withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('${medico.nombre} ${medico.apellidos}')),
                 const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, color: AppTheme.primary, size: 80.0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Column(
              children: [
                Switch(
                  value: medico.estado,
                  onChanged: (value) async {
                    var respuestaDialog = await displayDialogConfirm(context,
                        '¿Se encuentra seguro de inhabilitar al médico?');
                    // controller.cambiarEstadoMedico(medico);
                    // medico.setEstado(value);
                    if (respuestaDialog == true) {
                      bool isUpdated =
                          await controller.cambiarEstadoMedico(medico);

                      if (isUpdated == true) {
                        controller.update();
                      }
                    }
                  },
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        var x = await Navigator.pushNamed(
                            context, 'medico_editar',
                            arguments: medico);

                        if (x == null) {
                          controller.update();
                        }
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.edit),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, 'medico_paciente_listar',
                            arguments: medico);
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
