import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class DonneeMeteoPage extends StatefulWidget {
  const DonneeMeteoPage({Key? key}) : super(key: key);

  @override
  State<DonneeMeteoPage> createState() => _DonneeMeteoPageState();
}

class _DonneeMeteoPageState extends State<DonneeMeteoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Données météo"),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
    );
  }
}
