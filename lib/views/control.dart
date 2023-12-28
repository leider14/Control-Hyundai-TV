import 'package:control_hyundai/Themes.dart';
import 'package:control_hyundai/codes.dart';
import 'package:control_hyundai/funciones.dart';
import 'package:control_hyundai/models/bar_buttons.dart';
import 'package:control_hyundai/models/button.dart';
import 'package:control_hyundai/models/button_rectangle.dart';
import 'package:control_hyundai/models/circle_buttons.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int contador = 0;


  @override
  void initState() {
    ThemeApp().setColors(
      clButtons: temas[contador].colorButtons,
      clFonts: temas[contador].colorFonts,
      clBackground: temas[contador].colorScaffold
    );
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: ThemeApp.colorScaffoldBackground,
      body:
        Padding(padding: const EdgeInsets.fromLTRB(30,50,30,20),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    onPressed: (){sendCode(code: Codes.apagar);}, 
                    icono: Icons.power_settings_new_rounded
                  ),
                  Text("Hyundai Remote",textScaleFactor: 1.3,style: TextStyle(fontWeight: FontWeight.bold,color: ThemeApp.colorFonts),),
                  Button(
                    onPressed: (){
                      setState(() {
                        contador >= temas.length-1 ? contador=0 : contador++;
                        print(contador);
                        ThemeApp().setColors(
                          clButtons: temas[contador].colorButtons,
                          clFonts: temas[contador].colorFonts,
                          clBackground: temas[contador].colorScaffold
                        );
                      });
                      
                    }, 
                    icono: Icons.light_mode_outlined),
                ],
              ),
              const SizedBox(height: 20,),
              Center(
                child:
                CircleButtons(
                  radio: 120,
                  onPressedCenter: (){
                    sendCode(code: Codes.enter);
                  },
                  onPressedDown: (){sendCode(code: Codes.down);},
                  onPressedLeft: (){sendCode(code: Codes.left);},
                  onPressedRight: (){sendCode(code: Codes.right);},
                  onPressedUp: (){sendCode(code: Codes.up);},
                )
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BarButtons(
                    childMiddle: Icon(Icons.volume_up_rounded,color: ThemeApp.colorFonts),
                    iconDownButton: Icons.remove,
                    iconUpButton: Icons.add,
                    onPressedDown: (){sendCode(code: Codes.voldown);},
                    onPressedUp: (){sendCode(code: Codes.volup);},
                  ),
                    Column(
                      children: [
                        ButtonRectangle(onPressed: (){sendCode(code: Codes.menu);},child: const Text("Menú"),),
                        SizedBox(height: 20,),
                        ButtonRectangle(onPressed: (){sendCode(code: Codes.sleep);},child: const Text("Sleep"),),
                        SizedBox(height: 20,),
                        ButtonRectangle(onPressed: (){sendCode(code: Codes.canal);},child: const Text("Canal"),),
                      ],
                    ),
                  BarButtons(
                    childMiddle: Text("CH",style: TextStyle(color: ThemeApp.colorFonts,fontWeight: FontWeight.bold),),
                    iconDownButton: Icons.keyboard_arrow_down,
                    iconUpButton: Icons.keyboard_arrow_up,
                    onPressedDown: (){sendCode(code: Codes.chdown);},
                    onPressedUp: (){sendCode(code: Codes.chup);},
                  ),
                ],
              ),
              Padding(
                padding:const EdgeInsets.only(left: 15, right: 15),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonRectangle(onPressed: (){sendCode(code: Codes.mute);}, child: const Icon(Icons.volume_off_rounded)),
                    const SizedBox(width: 10,),
                    Expanded(
                      child:  ButtonRectangle(onPressed: (){sendCode(code: Codes.exit);}, child: const Icon(Icons.keyboard_return)),
                    ),
                    const SizedBox(width: 10,),
                    ButtonRectangle(onPressed: (){sendCode(code: Codes.input);}, child: const Icon(Icons.menu)),
                  ],
                )
              ),

            ],
          )
        )
    );
  }
}