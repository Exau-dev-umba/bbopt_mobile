import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvisPage extends StatefulWidget {
  const AvisPage({Key? key}) : super(key: key);

  @override
  State<AvisPage> createState() => _AvisPageState();
}

class _AvisPageState extends State<AvisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('LES AVIS', style: TextStyle(color: Constantes.Colorjaune),),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
        actions: [
          Row(
            children: [
              badges.Badge(
                position: badges.BadgePosition.custom(top: 10.sp, end: 10.sp),
                child: IconButton(
                  icon:Icon(CupertinoIcons.bell),
                  onPressed: (){},),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Constantes.Colorwhite,
                ),
              ),

              IconButton(
                padding: EdgeInsets.only(right: 5),
                icon: Icon(CupertinoIcons.chat_bubble),
                onPressed: (){},
              )
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
