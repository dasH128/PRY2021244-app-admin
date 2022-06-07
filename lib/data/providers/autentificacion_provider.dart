import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AutentificacionProvider extends GetConnect {
  Future<bool> login(String correo, String password) async {
    try {
    //   print('$correo $password');
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: correo, password: password);

    //   print('credential--------- ');
    //   print(credential);
    //   print(credential.additionalUserInfo);
    //   print(credential.credential);
    //   print(credential.user!.uid);

      return true;
    } catch (e) {
    //   print('eeee $e');
      return false;
    }
  }
}
