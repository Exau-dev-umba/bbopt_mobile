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
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
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
                width: double.infinity,
              ),
              Positioned(
                top: 30,
                left: 20,
                child: Image.asset(
                  "assets/images/facebook-logo_2504792.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          Container(
              color: Constantes.Colorwhite,
              alignment: Alignment.center,
              width: double.infinity,
              height: 60,
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
                        Icon(Icons.save, color: Constantes.Colorjaune,),
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
