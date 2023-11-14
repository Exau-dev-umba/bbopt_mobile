import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfosDialogue{

  static contactezNous(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Constantes.ColorvertFonce,
          title: new Text("Contactez Bbopt"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text("Ecrivez-nous via : infos@bbopt.net"),
            ],
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text("OK", style: TextStyle(color: Constantes.ColorvertFonce),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

