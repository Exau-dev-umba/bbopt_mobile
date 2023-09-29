import 'package:bbopt_mobile/controllers/TacheController.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/ChampController.dart';
import '../../controllers/UserController.dart';
import '../../utils/location_service.dart';

class AccueilPagePage extends StatefulWidget {
  const AccueilPagePage({Key? key}) : super(key: key);

  @override
  State<AccueilPagePage> createState() => _AccueilPagePageState();
}

class _AccueilPagePageState extends State<AccueilPagePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var champCtrl = context.read<ChampController>();
      var tacheCtrl = context.read<TacheController>();
      var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();
      champCtrl.recuperNbreChampsAPI();
      champCtrl.recuperChampAPI();
      tacheCtrl.recuperNbreTacheAPI();
    });
  }
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
      backgroundColor: Constantes.ColorLight,
      body: _body(),
    );
  }

  Widget _body(){
    var champCtrl = context.watch<ChampController>();
    var tacheCtrl = context.watch<TacheController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonBar(
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Constantes.Colorwhite,
                            borderRadius: BorderRadius.circular(8.sp),
                            boxShadow: [
                              BoxShadow(
                                  color: Constantes.Colorblack.withOpacity(.1),
                                  offset: Offset(0,1),
                                  spreadRadius: 2.sp,
                                  blurRadius: 1.sp
                              )
                            ]
                        ),
                        child: Text(
                          "Créer une tache",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                            color: Constantes.Colorblack

                          ),
                        )
                    ),
                    onTap: (){
                      // Navigator.pushNamed(context, Routes.champRoute);
                    },
                  )
                ],
              ),
              ButtonBar(
                children: [
                  InkWell(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Constantes.Colorwhite,
                            borderRadius: BorderRadius.circular(8.sp),
                            boxShadow: [
                              BoxShadow(
                                  color: Constantes.Colorblack.withOpacity(.1),
                                  offset: Offset(0,1),
                                  spreadRadius: 2.sp,
                                  blurRadius: 1.sp
                              )
                            ]
                        ),
                        child: Text(
                          "Créer un champs",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Constantes.Colorblack

                          ),
                        )
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.createChampRoute);
                    },
                  )
                ],
              ),
            ],
          ),
          carteAffiche("Météo Locale", "26°", image: "assets/images/cloudy_1163657.png", ""),
          carteAffiche("Humidité", "20%", image: "assets/images/humidity (1).png", ""),
          carteAffiche("Vos champs", "${champCtrl.nbrChamp?? '0'}", image: "assets/images/des-champs (1).png", subtitle: "${champCtrl.nbrChamp?? '0'} culture(s) en croissance", Routes.champRoute),
          carteAffiche("Tâches", "${tacheCtrl.nbrtache?? '0'}", image: "assets/images/target.png", Routes.taskRoute),
        ],
      ),
    );
  }
  
  carteAffiche(String title, String value, String routeName, {String? image,String? subtitle})  {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.only(right: 20.sp, left: 20.sp, top: 20.sp),
          margin: EdgeInsets.only(right: 15.sp, left: 15.sp, bottom: 20.sp),
          alignment: Alignment.centerRight,
          width: Adaptive.w(100),
          height: 15.h,
          decoration: BoxDecoration(
            color: Constantes.Colorwhite,
            borderRadius: BorderRadius.circular(15.sp),
            boxShadow: [
              BoxShadow(
                color: Constantes.Colorblack.withOpacity(.1),
                offset: const Offset(3,5),
                spreadRadius: 2.sp,
                blurRadius: 1.sp
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Constantes.ColorvertFonce,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: 15.sp,),
                  Text(
                      value,
                      style: TextStyle(
                          fontSize: 23.sp,
                          color: Constantes.ColorvertFonce,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),

                  ),
                  SizedBox(height: 1.sp,),
                  Text(
                      subtitle ?? "",
                      style: TextStyle(
                          fontSize: 15.sp),
                      overflow: TextOverflow.ellipsis)
                ],
              ),
              Image.asset(image!, width: Adaptive.w(10),),
            ],
          ),
        ),
      ),
    );
  }
  
}
