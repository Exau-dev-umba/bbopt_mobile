import 'package:bbopt_mobile/controllers/TacheController.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key:key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>{
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var taskCtrl = context.read<TacheController>();
      taskCtrl.recuperTachesAPI();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Constantes.ColorLight,
      appBar: AppBar(
        title: Text("VOS TACHES"),
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
          _tableau()
        ],
      )
    );
  }

  Widget _tableau(){
    var taskCtrl = context.watch<TacheController>();

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
                      "Date attendue",
                      style: TextStyle(
                          color: Constantes.ColorvertFonce,
                          fontWeight: FontWeight.w500
                      ),
                    )
                ),
                DataColumn(
                    label: Text(
                      "Actions",
                      style: TextStyle(
                          color: Constantes.ColorvertFonce,
                          fontWeight: FontWeight.w500
                      ),
                    )
                ),
              ],
              rows: taskCtrl.taches!.isEmpty ? [DataRow(cells: <DataCell>[DataCell(Text("Aucune donnée-"))])]: taskCtrl.taches!.map((e) => DataRow(cells: <DataCell>[
                DataCell(Text("${e.title}")),
                DataCell(Text("${e.dueDate}")),
                DataCell(Text("Ezo ya")),
              ]),).toList(),
            )
          )
        ],
      ),
    );

   /* _floatingButtion(){
      return FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, Routes.createChampRoute);
        },
        backgroundColor: Constantes.ColorvertFonce,
        child: Icon(Icons.add),
      );
    };*/

  }
}