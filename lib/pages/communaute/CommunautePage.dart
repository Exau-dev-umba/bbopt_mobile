import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class CommunautePage extends StatefulWidget {
  const CommunautePage({Key? key}) : super(key: key);

  @override
  State<CommunautePage> createState() => _CommunautePageState();
}

class _CommunautePageState extends State<CommunautePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LA COMMUNAUTE', style: TextStyle(color: Constantes.Colorjaune),),
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
