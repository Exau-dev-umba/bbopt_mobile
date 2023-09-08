import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class StatPage extends StatefulWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/nav/menu.png'),
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
          width: double.infinity,
            child: Image.asset('assets/images/rice9.jpg', fit: BoxFit.fill,)
        ),
        _carte("INFORMATION DE VOTRE PLANTATION", 'assets/images/31172.jpg', Constantes.ColorvertFonce, Constantes.Colorwhite),
      ],
    );
  }

  _carte(String title, String image, Color background, Color colortext){
    return Container(
      margin: EdgeInsets.all(15),
      color: background,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
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
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
