import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class AccueilPagePage extends StatefulWidget {
  const AccueilPagePage({Key? key}) : super(key: key);

  @override
  State<AccueilPagePage> createState() => _AccueilPagePageState();
}

class _AccueilPagePageState extends State<AccueilPagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('ACCUEIL', style: TextStyle(color: Constantes.Colorjaune),),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: Container(
        color: Constantes.ColorvertFonce,
      ),
    );
  }

  Widget _body(){
    return Column(

    );
  }
}
