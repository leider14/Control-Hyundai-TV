import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:vibration/vibration.dart';
/*
if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
*/
Future<bool> checkIR() async {
  //Consulta si es compatible con IR
  final bool hasIrEmitter = await IrSensorPlugin.hasIrEmitter;
  return hasIrEmitter;
}

Future<void> sendCode({required String code}) async{
  Vibration.cancel();
  Vibration.vibrate(duration: 20);
  await IrSensorPlugin.transmitString(pattern: code); 
}