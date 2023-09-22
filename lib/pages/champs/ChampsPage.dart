
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChampsPage extends StatelessWidget {
  const ChampsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButtion(),
      backgroundColor: Constantes.ColorLight,
      appBar: AppBar(
        title: Text("VOS CHAMPS"),
        leadingWidth: 50,
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return Center(
      child: Stack(
        children: [
          tableau()
        ],
      ),
    );
  }
  tableau(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                        "NOM",
                        style: TextStyle(
                            color: Constantes.ColorvertFonce,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                  DataColumn(
                      label: Text(
                        "CULTURES",
                        style: TextStyle(
                            color: Constantes.ColorvertFonce,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                  DataColumn(
                      label: Text(
                        "TEMPERATURE",
                        style: TextStyle(
                            color: Constantes.ColorvertFonce,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                  DataColumn(
                      label: Text(
                        "ACTION",
                        style: TextStyle(
                            color: Constantes.ColorvertFonce,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(
                            Text("Manioc")
                        ),
                        DataCell(
                            Text("Manioc")
                        ),
                        DataCell(
                            Text("20°")
                        ),
                        DataCell(
                            Text("En cours")
                        ),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(
                            Text("Legumes")
                        ),
                        DataCell(
                            Text("Legumes")
                        ),
                        DataCell(
                            Text("18°")
                        ),
                        DataCell(
                            Text("Près à recolter")
                        ),
                      ]
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }

  _floatingButtion(){
    return FloatingActionButton(
        onPressed: (){},
      backgroundColor: Constantes.ColorvertFonce,
      child: Icon(Icons.add),
    );
  }

}

