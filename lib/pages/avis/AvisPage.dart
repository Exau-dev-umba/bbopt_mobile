import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class AvisPage extends StatefulWidget {
  const AvisPage({Key? key}) : super(key: key);

  @override
  State<AvisPage> createState() => _AvisPageState();
}

class _AvisPageState extends State<AvisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LES AVIS', style: TextStyle(color: Constantes.Colorjaune),),
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
