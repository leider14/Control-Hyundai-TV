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
    //Cambios de claro a oscuro, con el color del systema
    if(MediaQuery.of(context).platformBrightness == Brightness.light){
      ThemeApp().setColors(
        clButtons: temas[0].colorButtons,
        clFonts: temas[0].colorFonts,
        clBackground: temas[0].colorScaffold
      );
    }else{
      ThemeApp().setColors(
        clButtons: temas[1].colorButtons,
        clFonts: temas[1].colorFonts,
        clBackground: temas[1].colorScaffold
      );
    }
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
                    icono: Icons.keyboard_alt_outlined,
                    onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return 
                          Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Button(onPressed: (){sendCode(code: Codes.uno);},text: "1",),
                                    Button(onPressed: (){sendCode(code: Codes.dos);},text: "2",),
                                    Button(onPressed: (){sendCode(code: Codes.tres);},text: "3",),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Button(onPressed: (){sendCode(code: Codes.cuatro);},text: "4",),
                                    Button(onPressed: (){sendCode(code: Codes.cinco);},text: "5",),
                                    Button(onPressed: (){sendCode(code: Codes.seis);},text: "6",),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Button(onPressed: (){sendCode(code: Codes.siete);},text: "7",),
                                    Button(onPressed: (){sendCode(code: Codes.ocho);},text: "8",),
                                    Button(onPressed: (){sendCode(code: Codes.nueve);},text: "9",),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Button(onPressed: (){sendCode(code: Codes.cero);},text: "0",),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }, 
                    
                  ),
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