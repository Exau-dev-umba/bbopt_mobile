import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class DiagnostiquePage extends StatefulWidget {
  const DiagnostiquePage({Key? key}) : super(key: key);

  @override
  State<DiagnostiquePage> createState() => _DiagnostiquePageState();
}

class _DiagnostiquePageState extends State<DiagnostiquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIAGNOSTIQUER', style: TextStyle(color: Constantes.Colorjaune),),
        leading: Icon(Icons.arrow_back, color: Constantes.Colorjaune,),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
