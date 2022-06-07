import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/ui/screens/home/home_controller.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';
import 'package:glucoadmin/ui/utils/display_dialog_logout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(),
        drawer: _drawerView(context, controller),
        body: SafeArea(
          child: _body(context),
        ),
      );
    });
  }

  Widget _drawerView(BuildContext context, HomeController controller) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: AppTheme.primary,
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          color: AppTheme.primary, size: 80.0),
                    ),
                  ),
                  Text(
                    '   Hola ',
                    style: AppTheme.textStlyle,
                  ),
                ],
              )),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppTheme.primary,
            ),
            title: const Text('Inicio', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.list_alt,
              color: AppTheme.primary,
            ),
            title: const Text('Registar', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushNamed(context, 'medico_registrar');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
              color: AppTheme.primary,
            ),
            title: const Text('Administrar', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushNamed(context, 'medico_listar');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: AppTheme.primary,
            ),
            title: const Text('Salir', style: AppTheme.textStlyle),
            onTap: () async {
              var respuesta = await displayDialogLogOut(context);
              if (respuesta == true) {
                //Cerrar Session
                controller.logout();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'login');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _cardMenu(context, Icons.list_alt, 'Registrar Médicos',
                'medico_registrar'),
            _cardMenu(
                context, Icons.dashboard, 'Administrar Médicos', 'medico_listar'),
          ],
        ),
      ),
    );
  }

  Widget _cardMenu(
      BuildContext context, IconData icon, String texto, String router) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      //   color: Colors.red,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 15,
        shadowColor: AppTheme.primary.withOpacity(0.4),
        child: InkWell(
          onTap: () async {
            Navigator.pushNamed(context, router);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 170,
                height: 170,
                child: Icon(
                  icon,
                  size: 170,
                  color: AppTheme.primary,
                ),
              ),
              Text(
                texto,
                style: AppTheme.textEtiquetaTituloStlyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
