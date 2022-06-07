import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoadmin/ui/routes/app_routes.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        initialRoute: AppRoutes.initialRouter,
        routes: AppRoutes.routes,
        theme: AppTheme.lightTheme,
    );
  }
}
