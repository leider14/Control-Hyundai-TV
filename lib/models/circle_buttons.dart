import 'package:control_hyundai/Themes.dart';
import 'package:flutter/material.dart';

class CircleButtons extends StatefulWidget {
  final double radio;
  final IconData iconLeft;
  final IconData iconRight;
  final IconData iconUp;
  final IconData iconDown;
  final VoidCallback onPressedLeft;
  final VoidCallback onPressedRight;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;
  final VoidCallback onPressedCenter;
  const CircleButtons({
    super.key,
    this.radio = 125,
    this.iconDown = Icons.keyboard_arrow_down,
    this.iconLeft = Icons.keyboard_arrow_left,
    this.iconRight = Icons.keyboard_arrow_right,
    this.iconUp = Icons.keyboard_arrow_up,
    required this.onPressedDown,
    required this.onPressedLeft,
    required this.onPressedRight,
    required this.onPressedUp,
    required this.onPressedCenter,
  });

  @override
  State<CircleButtons> createState() => _CircleButtonsState();
}

class _CircleButtonsState extends State<CircleButtons> {

  Widget boton({required VoidCallback onPressed,required IconData icono}){
    return 
    GestureDetector(
      onTap: () {onPressed();},
      child:
        Container(
          width: widget.radio* 0.6,
          height: widget.radio* 0.6,
          color: Colors.transparent,
          child: Center(
            child: Icon(icono,color: ThemeApp.colorFonts),
          ),
        ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.radio * 2 ),
      height: widget.radio * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeApp.colorButtons,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          boton(onPressed: (){widget.onPressedLeft();}, icono: widget.iconLeft),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              boton(onPressed: (){widget.onPressedUp();}, icono: widget.iconUp),
              boton(onPressed: (){widget.onPressedCenter();}, icono: Icons.fiber_manual_record),
              boton(onPressed: (){widget.onPressedDown();}, icono: widget.iconDown),
            ],
          ),
          boton(onPressed: (){widget.onPressedRight();}, icono:widget.iconRight)
        ],
      ),
    );
  }
}