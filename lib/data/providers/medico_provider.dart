import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/domain/medico_model.dart';

class MedicoProvider extends GetConnect {
  final CollectionReference medicosCollectionReference =
      FirebaseFirestore.instance.collection('medicos');

  Future<String> crearCuentaMedico(String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var id = credential.user!.uid;
      print('el id es $id');
      print(credential.user);
      return id;
    } catch (e) {
      return '';
    }
  }

  Future<bool> registrar(MedicoModel medico) async {
    try {
      //   CollectionReference medicos =
      //       FirebaseFirestore.instance.collection('medicos');
      var medicoMap = medico.toMap();
      await medicosCollectionReference.doc(medico.id).set(medicoMap);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<QuerySnapshot<Object?>> listarMedicos() async {
    // CollectionReference collectionStreamMedicos =
    //     FirebaseFirestore.instance.collection('medicos');

    return medicosCollectionReference.get();
  }

  Future<bool> cambiarEstadoMedico(MedicoModel medico) async {
    try {
      bool value = medico.estado;
      print('pipip ${medico.id} ${medico.estado} ');
      await medicosCollectionReference
          .doc(medico.id)
          .update({"estado": !value});
      return true;
    } catch (e) {
      print('cambiarEstadoMedico $e');
      return false;
    }
  }

  Future<bool> editarMedico(MedicoModel medico, String idMedico) async {
    try {
      // print('editarMedico $idMedico ${medico.id} ');}
      medico.setId(idMedico);
      var medicoMap = medico.toMap();
      await medicosCollectionReference.doc(idMedico).update(medicoMap);
      return true;
    } catch (e) {
      print('editarMedico $e');
      return false;
    }
  }
}
