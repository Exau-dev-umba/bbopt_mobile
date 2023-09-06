import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class DiscuterPage extends StatefulWidget {
  const DiscuterPage({Key? key}) : super(key: key);

  @override
  State<DiscuterPage> createState() => _DiscuterPageState();
}

class _DiscuterPageState extends State<DiscuterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DISCUTER', style: TextStyle(color: Constantes.Colorjaune),),
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
