import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/ui/screens/login/login_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';
import 'package:glucoadmin/ui/utils/display_dialog_android.dart';
import 'package:glucoadmin/ui/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: AppTheme.heightInputs,
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
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.password,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Contraseña'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  width: double.infinity,
                  child: _crearBotonContinuar(context, controller),
                ),
                const SizedBox(height: 10),
                // InkWell(
                //     onTap: () async {
                //       Navigator.pushReplacementNamed(
                //           context, 'recuperar_password');
                //     },
                //     child: const Text(
                //       '¿Has olvidado la contraseña?',
                //       style: AppTheme.textEtiquetaStlyle,
                //     ))
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _crearBotonContinuar(
      BuildContext context, LoginController controller) {
    if (controller.isLoading == true) {
      return const CustomLoadingButton();
    } else {
      return ElevatedButton(
        onPressed: () async {
          var isLogin200 = await controller.login();
          if (isLogin200 == true) {
            Navigator.pushReplacementNamed(context, 'home');
          } else {
            //   controller.alerta('login', 'Intentelo otra vez');
            await displayDialogAndroid(
                context,
                '',
                'Hubo un error, intentelo otra vez',
                Icons.highlight_off_outlined);
          }
        },
        child: const Text('Continuar', style: AppTheme.textBtnStlyle),
      );
    }
  }
}
