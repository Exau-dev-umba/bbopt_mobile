
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnalysePage extends StatelessWidget {
  const AnalysePage({Key? key}) : super(key: key);

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              position: badges.BadgePosition.custom(top: 10.sp, end: 10.sp),
              child: IconButton(
                icon:Icon(CupertinoIcons.bell),
                onPressed: (){},),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Constantes.Colorwhite,
              ),
            ),
          ),
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
          color: Constantes.ColorLight,
        ),
        SingleChildScrollView(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 260, top: 15),
                  child: Text("Analyse", style: TextStyle(
                    color: Constantes.ColorvertFonce,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                _carte(
                  title: "Veuillez cliquez sur une culture pour effectuer l'analyse",
                  sizeTitle: 21.sp,
                  sizeCarte: 23.h,
                  boldTitle: FontWeight.w600,
                  image: 'assets/images/cornfield.jpgg',
                  background: Constantes.Colorwhite,
                  colortext: Constantes.ColorvertFonce,
                ),
                _carte(
                  title: "Découvrez notre système d'analyse de plante",
                  sizeTitle: 18.sp,
                  boldTitle: FontWeight.w500,
                  sizeCarte: 40.h,
                  simple:
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Dévoilez les secrets de vos plantes en un instant ! "
                                  "Transformez une simple photo en une consultation végétale personnalisée. "
                                  "Découvrez la santé de vos cultures, "
                                  "identifiez les éventuelles maladies et cultivez le futur avec notre analyse intelligente. "
                                  "Votre jardin mérite le meilleur, offrez-lui une expertise numérique aujourd'hui !",
                            style: TextStyle(
                              fontSize: 16.sp,
                              wordSpacing: 5
                            ),
                          ),
                          Spacer(),
                          Text("ORIENTATION", style: TextStyle(
                            color: Constantes.ColorvertFonce,
                            fontWeight: FontWeight.bold,
                          ),),
                          Spacer(),
                          Text("Cliquez sur les noms des cultures ci-dessus", style: TextStyle(
                          ),),

                        ],
                      ),
                    ),
                  image: 'assets/images/cornfield.jpgg',
                  background: Constantes.Colorwhite,
                  colortext: Constantes.ColorvertFonce,
                ),
              ]
          ),
        ),
      ],
    );
  }

  _carte(
      {
        required String title,
        required double sizeTitle,
        FontWeight? boldTitle,
        List<Widget>? subTiitle,
        required String image,
        required Color background,
        double? sizeCarte,
        Widget? simple,
        required Color colortext,
      }){
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: background,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            color: Colors.black54,
            offset: Offset.fromDirection(1),
          )
        ]
      ),
      height: sizeCarte??200,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: TextStyle(
                color: colortext,
                fontSize: sizeTitle,
                fontWeight: boldTitle
              ),
            ),
            Divider( color: Colors.black54,),
            simple?? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: subTiitle??[
                  button(text: "Manioc", onPressed: (){}),
                  button(text: "Maïs", onPressed: (){}),
                  button(text: "Riz", onPressed: (){}),
                  button(text: "Tomate", onPressed: (){}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button({required Function? onPressed, required String text}){
    return InkWell(
      child: Container(
        child: Text(
          "$text",
          style: TextStyle(
              color: Colors.black87,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      onTap: onPressed!(),
    );
  }

  _carteGrand(String title, String image, Color background, Color colortext, {Function? onTap}){
    return InkWell(
        child: Container(
            width:Adaptive.w(500),
          height:30.h,
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
              Flexible(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constantes.ColorvertFonce,
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    child: Text(title, style: TextStyle(color: colortext, fontSize: 20.sp, fontWeight:FontWeight.w300),)
                ),
              ),
            ],
          ),
        ),
        onTap: onTap!()
    );
  }
}
