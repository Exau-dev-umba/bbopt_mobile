
import 'package:bbopt_mobile/controllers/ChampController.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChampsPage extends StatefulWidget {
  const ChampsPage({Key? key}) : super(key: key);

  @override
  State<ChampsPage> createState() => _ChampsPageState();
}

class _ChampsPageState extends State<ChampsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var champCtrl = context.read<ChampController>();
      champCtrl.recuperChampAPI();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButtion(),
      backgroundColor: Constantes.ColorLight,
      appBar: AppBar(
        title: Text("VOS CHAMPS"),
        leadingWidth: 25.sp,
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
    var champCtrl = context.watch<ChampController>();
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
                        "CULTURE",
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
                rows: champCtrl.champ!.map((e) =>DataRow(
                    cells: <DataCell>[
                      DataCell(Text("${e.nom}")),
                      DataCell(Text("Non trouvé")),
                      DataCell(Text("${e.temperature??'__°'}")),
                      DataCell(Text("En cours")),
                    ]
                ),).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _floatingButtion(){
    return FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, Routes.createChampRoute);
        },
      backgroundColor: Constantes.ColorvertFonce,
      child: Icon(Icons.add),
    );
  }
}

