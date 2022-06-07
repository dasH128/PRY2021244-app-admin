import 'package:flutter/material.dart';
import 'package:glucoadmin/ui/screens/screens.dart';

class AppRoutes {
  static const initialRouter = 'loading';
  static Map<String, Widget Function(BuildContext)> routes = {
    'loading': (BuildContext context) => const LoadingScreen(),
    'home': (BuildContext context) => const HomeScreen(),
    'inicio': (BuildContext context) => const InicioScreen(),
    'recuperar_password': (BuildContext context) => const RecuperarPasswordScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'medico_registrar': (BuildContext context) => const MedicoRegistroScreen(),
    'medico_listar': (BuildContext context) => const MedicoListaScreen(),
    'medico_editar': (BuildContext context) => const MedicoEditarScreen(),
    'medico_paciente_listar': (BuildContext context) => const MedicoPacienteListaScreen(),
  };
}
