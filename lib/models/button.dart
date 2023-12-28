import 'package:control_hyundai/Themes.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icono;
  const Button({super.key,required this.onPressed,required this.icono, });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: ThemeApp.colorButtons,
        foregroundColor: ThemeApp.colorFonts,
      ),
      onPressed: (){widget.onPressed();},
      child:Icon(widget.icono)
    );
  }
}