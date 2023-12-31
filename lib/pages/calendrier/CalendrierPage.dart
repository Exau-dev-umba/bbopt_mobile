import 'package:bbopt_mobile/models/MessageModel.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalendrierPage extends StatefulWidget {
  const CalendrierPage({Key? key}) : super(key: key);

  @override
  State<CalendrierPage> createState() => _CalendrierPageState();
}

class _CalendrierPageState extends State<CalendrierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('CALENDRIER', style: TextStyle(color: Constantes.Colorjaune),),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
