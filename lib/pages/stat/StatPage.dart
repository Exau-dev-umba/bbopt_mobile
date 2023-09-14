
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class StatPage extends StatelessWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/LOGO AGRIOPT 2K23.png',
            fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 0.4,
            )
          ],
        ),
        leadingWidth: 50,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20, bottom: 20),
            child: badges.Badge(
              child: Icon(CupertinoIcons.bell),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Constantes.Colorwhite
              ),
            ) ,

          )
        ],
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.green.shade900.withOpacity(0.3),
          ),
          child: Image.asset(
            'assets/images/5104192.jpg', // The path to your background image
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        SingleChildScrollView(
          child: Column(
              children: [
                _carte("INFORMATION DE VOTRE PLANTATION", 'assets/images/cornfield.jpg', Constantes.ColorvertFonce, Constantes.Colorwhite, onTap:(){}),
                _carte("INFORMATION SUR LA RECOLTE", 'assets/images/rice9.jpg', Constantes.ColorvertFonce, Constantes.Colorwhite, onTap:(){}),
                _carte(
                    "DONNEES METEO",
                    'assets/images/cloudy_1163657.png',
                    Constantes.Colormauve,
                    Constantes.Colorwhite,
                    onTap:(){
                      // Navigator.pushNamed(context, Routes.donneeMeteo);
                    }
                ),
                _carteGrand("CONSULTEZ NOS ABONNEMENTS", 'assets/images/30894.jpg', Constantes.ColorvertFonce, Constantes.Colorjaune, onTap:(){}),
                _carteGrand("CONSEIL D'UN AGRONOME", 'assets/images/30894.jpg', Constantes.ColorvertFonce, Constantes.Colorjaune, onTap:(){}),
              ]
          ),
        ),
      ],
    );
  }

  _carte(String title, String image, Color background, Color colortext, {Function? onTap}){
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Constantes.ColorvertFonce,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:5),
                child: Text(title, style: TextStyle(color: colortext, fontSize: 15),),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 3,
                    color: Constantes.Colorwhite,
                    style: BorderStyle.solid,
                  )
                ),
                  width: 60,
                  height: 60,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                    backgroundColor: Constantes.ColorvertDark
                ),
              ),
            ],
          ),
        ),
      ),
        onTap: onTap!()
    );
  }

  _carteGrand(String title, String image, Color background, Color colortext, {Function? onTap}){
    return InkWell(
        child: Container(
            width:500,
          height:200,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image: AssetImage(image)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constantes.ColorvertFonce,
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 60,
                  child: Text(title, style: TextStyle(color: colortext, fontSize: 22, fontWeight:FontWeight.w300),)
              ),
            ],
          ),
        ),
        onTap: onTap!()
    );
  }
}
