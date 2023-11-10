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
          title: new Text("Welcome to Bbopt"),
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
  deconnexion(context) async {
    bool? resulat = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Deconnexion"),
          content: new Text("Vou"),
          actions: <Widget>[
            TextButton(
              child: new Text(
                "Annuler",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            new TextButton(
              child: new Text("Confirmer"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
// code executé apres fermeture de la boite de dialogue
//     if (resulat != null) {
//       var message = !resulat ? "Suppression Annulée" : "Suppression confirmée";
//       showSnackBar(context, message);
//     }
  }
}

