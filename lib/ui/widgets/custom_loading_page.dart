import 'package:flutter/material.dart';
import 'package:glucoadmin/ui/themes/app_theme.dart';

class CustomLoadingPage extends StatelessWidget {
   
  const CustomLoadingPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        // color: Colors.red,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: const [
                CircularProgressIndicator(),
                Text("Loading", style: AppTheme.textEtiquetaStlyle,)
            ],
        ),
    );
  }
}