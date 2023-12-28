import 'package:control_hyundai/Themes.dart';
import 'package:flutter/material.dart';

class BarButtons extends StatefulWidget {
  final double width;
  final double height;
  final IconData iconUpButton;
  final IconData iconDownButton;
  final Widget childMiddle;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;

  const BarButtons(
      {super.key,
      this.width = 70,
      this.height = 200,
      required this.childMiddle,
      required this.iconDownButton,
      required this.iconUpButton,
      required this.onPressedDown,
      required this.onPressedUp});

  @override
  State<BarButtons> createState() => _BarButtonsState();
}

class _BarButtonsState extends State<BarButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeApp.colorButtons),
      child: Column(
        children: [
          Expanded(
              child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  widget.onPressedUp();
                },
                child: SizedBox(
                  width: widget.width,
                  child: Icon(
                    widget.iconUpButton,
                    color: ThemeApp.colorFonts,
                  ),
                )),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: widget.childMiddle,
          ),
          Expanded(
              child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        widget.onPressedDown();
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: widget.width,
                        child: Icon(widget.iconDownButton,
                            color: ThemeApp.colorFonts),
                      )))),
        ],
      ),
    );
  }
}
