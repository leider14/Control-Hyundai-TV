
import 'package:control_hyundai/Themes.dart';
import 'package:flutter/material.dart';

class ButtonRectangle extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color backgroundColor = ThemeApp.colorButtons;
  final Color foregroundColor = ThemeApp.colorFonts;
  ButtonRectangle({
    required this.onPressed,
    required this.child,
    super.key
  });

  @override
  State<ButtonRectangle> createState() => _ButtonRectangleState();
}

class _ButtonRectangleState extends State<ButtonRectangle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        elevation: 0,
        foregroundColor: widget.foregroundColor,
        padding: const EdgeInsets.fromLTRB(26,15,26,15)
      ),
      onPressed: (){widget.onPressed();},
      child: widget.child
    );
  }
}