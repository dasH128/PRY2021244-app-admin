import 'package:flutter/material.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              const Text(
                'GlucoMed',
                style: TextStyle(
                    fontSize: 52.0,
                    color: AppTheme.primary,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w800),
              ),
              const Text(
                'inicia tu monitoreo',
                style: AppTheme.textEtiquetaTituloStlyle,
              ),
              Container(height: 390),
              SizedBox(
                //   color: Colors.red,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacementNamed(context, 'login');
                          },
                          child: const Text('Iniciar Sesión'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
