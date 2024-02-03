import 'package:flutter/material.dart';

class ThemeApp{
  static Color colorScaffoldBackground= Color.fromARGB(255, 78, 72, 72);
  static Color colorButtons = const Color.fromARGB(255, 20, 16, 16);
  static Color colorFonts = const Color.fromARGB(255, 255, 255, 255);
  
  void setColors({required  Color clButtons,required  Color clFonts,required  Color clBackground,}){
    colorButtons = clButtons;
    colorScaffoldBackground = clBackground;
    colorFonts = clFonts;
  }
}

class Theme{
  final Color colorScaffold;
  final Color colorButtons;
  final Color colorFonts;
  Theme({
    required this.colorFonts,
    required this.colorButtons,
    required this.colorScaffold
  });
}

List<Theme> temas =[
  Theme(
    colorButtons: Color.fromARGB(255, 230, 230, 230),
    colorFonts: Color.fromARGB(255, 0, 0, 0),
    colorScaffold: Color.fromARGB(255, 255, 255, 255)
  ),
  Theme(
    colorButtons: Color.fromARGB(255, 42, 42, 46),
    colorFonts: Colors.white,
    colorScaffold: Color.fromARGB(255, 20, 18, 18)
  ),
]; 


