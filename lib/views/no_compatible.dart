
import 'package:flutter/material.dart';

class NoCompatible extends StatelessWidget {
  const NoCompatible({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body:
      const 
      Padding(
        padding: EdgeInsets.only(left:40,right: 40),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tu dispositivo no es compatible con Infra Rojo",textAlign: TextAlign.center,)
          ],
        )
      )
    );
  }
}