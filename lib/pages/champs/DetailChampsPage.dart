import 'package:bbopt_mobile/controllers/ChampController.dart';
import 'package:bbopt_mobile/models/ChampModel.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
/*        actions: [
          DropdownButton<String>(
            padding: EdgeInsets.only(right: 12.sp),
            icon: Icon(Icons.more_vert, color: Constantes.Colorwhite),
            items: <String>['Supprimer','Modier'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          )
        ],*/
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
                        "assets/images/side-view-hands-holding-plant.jpg"),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child:  topContentText()       /*Text(
                champ.nom!,
                style: TextStyle(fontSize: 18.0),
              ),*/
            ),
/*        Positioned(
              left: 8.0,
              top: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            )*/
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
              child: Text("+ DATE DE PLANATATION DES CULTURES",
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
          Icons.directions_car,
          color: Colors.white,
          size: 25.0.sp,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Constantes.ColorvertClair),
        ),
        SizedBox(height: 10.0),
        Text(
          champ.nom!,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: champ.cultures!.map((e) {
                        return Text("${e}",style: TextStyle(color: Colors.white));
                      }).toList(),
                    ))),
            // Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );
  }

}
