import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class CalendrierPage extends StatefulWidget {
  const CalendrierPage({Key? key}) : super(key: key);

  @override
  State<CalendrierPage> createState() => _CalendrierPageState();
}

class _CalendrierPageState extends State<CalendrierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALENDRIER', style: TextStyle(color: Constantes.Colorjaune),),
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
