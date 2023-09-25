import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:responsive_sizer/responsive_sizer.dart';

class CommunautePage extends StatefulWidget {
  const CommunautePage({Key? key}) : super(key: key);

  @override
  State<CommunautePage> createState() => _CommunautePageState();
}

class _CommunautePageState extends State<CommunautePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('LA COMMUNAUTE', style: TextStyle(color: Constantes.Colorjaune),),
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
      body: _body()
    );
  }

  Widget _body(){
    return Container(
        color: Constantes.ColorvertFonce,
        child: SingleChildScrollView(
          child: Column(
              children:[
                _post("CONSEIL D'UN AGRONOME", 'assets/images/VISUEL-BBOPT-DECL3.jpg', Constantes.ColorvertFonce,746,385, Constantes.Colorjaune, onTap:(){}),
                _post("CONSEIL D'UN AGRONOME", 'assets/images/VISUEL-BBOPT-DECL2.jpg', Constantes.ColorvertFonce,609,250, Constantes.Colorjaune, onTap:(){}),
                _post("CONSEIL D'UN AGRONOME", 'assets/images/VISUEL-BBOPT-DECL2.jpg', Constantes.ColorvertFonce,609,250, Constantes.Colorjaune, onTap:(){}),
                _post("CONSEIL D'UN AGRONOME", 'assets/images/VISUEL-BBOPT-DECL3.jpg', Constantes.ColorvertFonce,746,385, Constantes.Colorjaune, onTap:(){}),

              ]
          ),
        )
    );
  }

  _post(String title, String image, Color background,int nbrLike,int nbrComment, Color colortext, {Function? onTap}){
    return Container(
      width:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: Adaptive.w(double.infinity),
              ),
              Positioned(
                top: 25.sp,
                left: 20.sp,
                child: Image.asset(
                  "assets/images/user.png",
                  width: 10.w,
                  height: 3.h,
                ),
              ),
            ],
          ),
          Container(
              color: Constantes.Colorwhite,
              alignment: Alignment.center,
              width: Adaptive.w(double.infinity),
              height: 10.h,
              child: Padding(
                padding: const EdgeInsets.only(left:20, right:20),
                child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Row(
                      children:[
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Constantes.Colorjaune,),
                            Text("609", style:TextStyle(color:colortext)),
                          ],
                        ),
                        SizedBox(width:10),
                        Row(
                          children: [
                            Icon(Icons.comment, color: Constantes.Colorjaune,),
                            Text("120", style:TextStyle(color:colortext)),
                          ],
                        ),
                      ]
                    ),
                    Row(
                      children:[
                        Text("SAVE", style:TextStyle(color:Constantes.Colorjaune)),
                        SizedBox(width:10),
                        Icon(Icons.bookmark, color: Constantes.Colorjaune,),
                      ]
                    )
                  ]
                ),
              )
          ),
        ],
      ),
    );
  }
}
