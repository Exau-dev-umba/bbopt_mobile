import 'package:bbopt_mobile/models/ChampModel.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailChampsPage extends StatelessWidget {
  final ChampModel champ;

  DetailChampsPage({super.key, required this.champ});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.ColorLight,
      appBar: AppBar(
        title: Text("${champ.nom?.toUpperCase()}"),
        leadingWidth: 25.sp,
        iconTheme: IconThemeData(color: Constantes.Colorwhite),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Constantes.ColorvertFonce,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              itemBuilder: (context)=>[
                PopupMenuItem(
                  onTap: (){

                  },
                    child: Row(
                      children: [
                        Icon(Icons.edit_note_sharp, color: Constantes.ColorvertFonce,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Modifier"),
                        )
                      ],
                    )
                ),
                PopupMenuItem(
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Supprimer"),
                        )
                      ],
                    )
                ),
              ],
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _body(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 10.0.sp),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                        "assets/images/31172.jpg"),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black87,),
              child:  topContentText()       /*Text(
                champ.nom!,
                style: TextStyle(fontSize: 18.0),
              ),*/
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.all(25.sp),
            child: ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Constantes.ColorvertFonce)
              ),
              // color: Color.fromRGBO(58, 66, 86, 1.0),
              child: Text("+ DATE DE PLANTATION DES CULTURES",
                  style: TextStyle(color: Colors.white)),
            )),
      ],
    );
  }

  Widget topContentText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0.h),
        Icon(
          Icons.local_florist_outlined,
          color: Colors.white,
          size: 28.0.sp,
        ),
        Container(
          width: Adaptive.w(40),
          child: new Divider(color: Constantes.ColorvertClair),
        ),
        SizedBox(height: 10.0),
        Text(
          champ.nom!,
          style: TextStyle(color: Colors.white, fontSize: 30.0.sp),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20.0.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Culture(s) : ".toUpperCase(),style: TextStyle(color: Colors.white)),
            // Expanded(flex: 1, child: Text("Culture(s) :")),
            Row(
              children: champ.cultures!.map((e) {
                return SizedBox(
                  width: Adaptive.w(18),
                  child: Container(
                    margin: EdgeInsets.all(2),
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Constantes.ColorvertFonce)
                        ),
                        child: Text(
                          "${e}",
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,)
                    ),
                  ),
                );
                return TextButton(
                  onPressed: (){

                  },
                    style: ButtonStyle(
                      // side: MaterialStateProperty.all(BorderSide(width: 5.sp, )),
                      backgroundColor: MaterialStateProperty.all(Constantes.ColorvertFonce),
                    ),
                  child: Text("${e}",style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis,));

              }).toList(),
            ),
            // Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );
  }

}
