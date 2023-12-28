
import 'package:control_hyundai/funciones.dart';
import 'package:control_hyundai/views/control.dart';
import 'package:control_hyundai/views/no_compatible.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Inicio()
      ),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Future<void> loading() async{
    await checkIR().then(
      (value) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return value ? Control():NoCompatible();
        },)
      );
      }
    );
  }

  @override
  void initState() {
    loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}