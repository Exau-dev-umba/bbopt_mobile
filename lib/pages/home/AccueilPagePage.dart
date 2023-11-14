
import 'dart:async';
import 'dart:io';

import 'package:bbopt_mobile/controllers/MeteoController.dart';
import 'package:bbopt_mobile/controllers/TacheController.dart';
import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/ChampController.dart';
import '../../controllers/UserController.dart';
import '../../utils/location_service.dart';

class AccueilPagePage extends StatefulWidget {
  const AccueilPagePage({Key? key}) : super(key: key);

  @override
  State<AccueilPagePage> createState() => _AccueilPagePageState();
}

class _AccueilPagePageState extends State<AccueilPagePage> with TickerProviderStateMixin {
  StreamController<void> _updateController = StreamController<void>();
  late final AnimationController _controller =
  AnimationController(vsync: this, duration: Duration(seconds: 1))
    ..repeat(reverse: true);

  late final Animation<double> _animation =
  CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

  TextEditingController date = TextEditingController();
  TextEditingController heure = TextEditingController();
  TextEditingController titreTache = TextEditingController();
  late Timer _timer;
  var isVisible=false;
  var tempF= 0.0;
  var humidity= 0;
  String desc= '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var champCtrl = context.read<ChampController>();
      var tacheCtrl = context.read<TacheController>();
      var userCtrl = context.read<UserCtrl>();
      var meteo = context.read<MeteoController>();
      var location = context.read<LocationService>();
      location.locationService();
      meteo.getWeatherData(latitude: "-4.44193110", longitude: "15.26629310");
      userCtrl.recuperDataAPI();
      champCtrl.recuperNbreChampsAPI();
      champCtrl.recuperChampAPI();
      tacheCtrl.recuperNbreTacheAPI();
      tacheCtrl.recuperTachesAPI();
      champCtrl.recuperNbrCulture();
    });

    _timer = Timer.periodic((Duration(seconds: 1)), (timer) {
      setState(() {
        var meteo = context.read<MeteoController>();
        meteo.getWeatherData(latitude: "-4.44193110", longitude: "15.26629310").then((value) => {
          tempF = value,
          debugPrint("TEMPERATURE : ${value.toStringAsFixed(0)}")
        });
      });
    });
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        var champCtrl = context.read<ChampController>();
        var tacheCtrl = context.read<TacheController>();
        var userCtrl = context.read<UserCtrl>();
        var location = context.read<LocationService>();
        champCtrl.recuperNbrCulture().then((value) => {
          debugPrint("DATA CULTURE : ${value}")
        });
        location.locationService();
        userCtrl.recuperDataAPI();
        champCtrl.recuperNbreChampsAPI();
        champCtrl.recuperChampAPI();
        tacheCtrl.recuperNbreTacheAPI();
        tacheCtrl.recuperTachesAPI();
      });
    });

    @override
    void dispose() {
      _timer.cancel();
      _updateController.close();

      super.dispose();
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
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
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              position: badges.BadgePosition.custom(top: 10.sp, end: 10.sp),
              child: IconButton(
                icon: Icon(CupertinoIcons.bell),
                onPressed: () {Navigator.pushNamed(context, Routes.notification);},
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Constantes.Colorwhite,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Constantes.ColorLight,
      body: _body(),
    );
  }

  Widget _body(){
    var champCtrl = context.watch<ChampController>();
    var tacheCtrl = context.watch<TacheController>();
    var meteo = context.watch<MeteoController>();
    var location = context.watch<LocationService>();
    return SingleChildScrollView(
      child: Column(
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*ButtonBar(
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Constantes.Colorwhite,
                            borderRadius: BorderRadius.circular(8.sp),
                            boxShadow: [
                              BoxShadow(
                                  color: Constantes.Colorblack.withOpacity(.1),
                                  offset: Offset(0,1),
                                  spreadRadius: 2.sp,
                                  blurRadius: 1.sp
                              )
                            ]
                        ),
                        child: Text(
                          "Créer une tache",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                            color: Constantes.Colorblack

                          ),
                        )
                    ),
                    onTap: (){
                      creationTache(context);
                      // print("DATA   :${location.latitude} - ${location.longitude}");
                      // Navigator.pushNamed(context, Routes.champRoute);
                    },
                  )
                ],
              ),*/
              ButtonBar(
                children: [
                  InkWell(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Constantes.Colorwhite,
                            borderRadius: BorderRadius.circular(8.sp),
                            boxShadow: [
                              BoxShadow(
                                  color: Constantes.Colorblack.withOpacity(.1),
                                  offset: Offset(0,1),
                                  spreadRadius: 2.sp,
                                  blurRadius: 1.sp
                              )
                            ]
                        ),
                        child: Text(
                          "Créer un champs",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Constantes.Colorblack

                          ),
                        )
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.createChampRoute);
                    },
                  )
                ],
              ),
            ],
          ),

          carteAffiche(
              "Météo Locale",
              "${meteo.temperature.toStringAsFixed(0)}°C",
              image: "${meteo.iconUrl}", 1, subtitle: "${meteo.description}"),

          carteAffiche("Humidité", "${meteo.humidite} %", image: "assets/images/humidity (1).png", 2, subtitle: "${meteo.ville}"),

          carteAffiche(
              "Vos champs",
              "${champCtrl.nbrChamp?? '0'}",
              image: "assets/images/des-champs (1).png",
              subtitle: "${champCtrl.nbrCulture?? '0'} culture(s) en croissance",3,
              onPressed: (){
                setState(() {
                  champCtrl.nbrChamp !=0?
                  Navigator.pushNamed(context, Routes.champRoute)
                      :showSnackBar(context, "Vous n'avez pas des champs, veillez en créer");
                });
          }),
          carteAffiche(
              "Tâches",
              "${tacheCtrl.nbrtache?? '0'}",
              image: "assets/images/target.png", 4,
              onPressed: (){
                tacheCtrl.nbrtache !=0
                    ? Navigator.pushNamed(context, Routes.taskRoute)
                    :showSnackBar(context, "Vous n'avez pas des tâches, veillez en créer");
          }),
        ],
      )
/*          :    Stack(
            children: [
        Column(
          children:  [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBar(
                    children: [
                      InkWell(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Constantes.Colorwhite,
                                borderRadius: BorderRadius.circular(8.sp),
                                boxShadow: [
                                  BoxShadow(
                                      color: Constantes.Colorblack.withOpacity(.1),
                                      offset: Offset(0,1),
                                      spreadRadius: 2.sp,
                                      blurRadius: 1.sp
                                  )
                                ]
                            ),
                            child: Text(
                              "Créer une tache",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Constantes.Colorblack

                              ),
                            )
                        ),
                        onTap: (){
                          creationTache(context);
                          // print("DATA   :${location.latitude} - ${location.longitude}");
                          // Navigator.pushNamed(context, Routes.champRoute);
                        },
                      )
                    ],
                  ),
                  ButtonBar(
                    children: [
                      InkWell(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Constantes.Colorwhite,
                                borderRadius: BorderRadius.circular(8.sp),
                                boxShadow: [
                                  BoxShadow(
                                      color: Constantes.Colorblack.withOpacity(.1),
                                      offset: Offset(0,1),
                                      spreadRadius: 2.sp,
                                      blurRadius: 1.sp
                                  )
                                ]
                            ),
                            child: Text(
                              "Créer un champs",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Constantes.Colorblack

                              ),
                            )
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, Routes.createChampRoute);
                        },
                      )
                    ],
                  ),
                ],
              ),
              noData(),
              noData(),
              noData(),
              noData(),
          ],
        ),
              Center(child: Text("Ploblème de connexion  😤"))
      ],
          )*/
    );


  }
  showSnackBar(context, String message,) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message,),
      backgroundColor: Constantes.Colorjaune,
      duration: Duration(seconds: 1),
      action: SnackBarAction(
          label: 'OK',
          textColor: Constantes.Colorwhite,
          onPressed: scaffold.hideCurrentSnackBar),
    ));
  }



  creationTache(BuildContext context) async {
    TextEditingController dateTache = TextEditingController();
    TextEditingController heure = TextEditingController();
    bool? resultat = await showDialog<bool>(
        context: context,
        builder: (ctx) {
          bool _error = false;
          return StatefulBuilder(builder: (_, StateSetter setInnerState) {
            return AlertDialog(
              title: Text('Ajouter une tâche'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: dateTache,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_month),
                        prefixIconColor: Constantes.ColorvertFonce,
                        focusedBorder: OutlineInputBorder(),
                        focusColor: Constantes.ColorvertFonce,
                        labelText: "Date",
                        hintText: "Saisir la date de la tâche",
                        errorText: _error ? "Champ obligatoire" : null),
                      onTap: ()async{
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if(pickDate!=null){
                          setState(() {
                            dateTache.text = DateFormat('yyyy-MM-dd').format(pickDate);
                          });
                        }
                      },
                  ),
                  SizedBox(height: 12.sp,),
                  TextField(
                    controller: heure,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.access_time_sharp),
                        prefixIconColor: Constantes.ColorvertFonce,
                        focusedBorder: OutlineInputBorder(),
                        focusColor: Constantes.ColorvertFonce,
                        labelText: "Heure",
                        hintText: "Saisir l'heure de la tâche",
                        errorText: _error ? "Champ obligatoire" : null),
                    onTap: ()async{
                      TimeOfDay? pickTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now());

                      if(pickTime!=null){
                        setState(() {
                          // heure.text = TimeForma;
                        });
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Annuler', style: TextStyle(color: Colors.grey),),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  child: Text('Valider', style: TextStyle(color: Constantes.ColorvertFonce),),
                  onPressed: () {
                    setInnerState(() {
                      _error = dateTache.text.isEmpty;
                    });
                    if (!_error) {
                      Navigator.pop(context, true);
                    }
                  },
                ),
              ],
            );
          });
        });

    // apres fermeture de la boite de dialogue
    // if (resultat != null) {
    //   showSnackBar(context, "Valeur saisie: ${dateTache.text} ");
    // }
  }

  
  carteAffiche(String title, String value,  int index, {String? image,String? subtitle, Function? onPressed})  {
    var meteo = context.watch<MeteoController>();
    return InkWell(
      onTap: onPressed as void Function()?,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(right: 20.sp, left: 20.sp, top: 20.sp),
          margin: EdgeInsets.only(right: 15.sp, left: 15.sp, bottom: 20.sp),
          alignment: Alignment.centerRight,
          width: Adaptive.w(100),
          height: 15.h,
          decoration: BoxDecoration(
            color: Constantes.Colorwhite,
            borderRadius: BorderRadius.circular(15.sp),
            boxShadow: [
              BoxShadow(
                color: Constantes.Colorblack.withOpacity(.1),
                offset: const Offset(3,5),
                spreadRadius: 2.sp,
                blurRadius: 1.sp
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Constantes.ColorvertFonce,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: 10.sp,),
                  Text(
                      value,
                      style: TextStyle(
                          fontSize: 23.sp,
                          color: Constantes.ColorvertFonce,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),

                  ),
                  // SizedBox(height: 1.sp,),
                  Text(
                      subtitle ?? "",
                      style: TextStyle(
                          fontSize: 15.sp),
                      overflow: TextOverflow.ellipsis)
                ],
              ),

              index==1?Image.network(image!, width: meteo.iconUrl!=null?null:Adaptive.w(10),):Image.asset(image!, width: Adaptive.w(10),),
            ],
          ),
        ),
      ),
    );
  }


  noData()  {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Placeholder(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.only(right: 20.sp, left: 20.sp, top: 20.sp),
            margin: EdgeInsets.only(right: 15.sp, left: 15.sp, bottom: 20.sp),
            alignment: Alignment.centerRight,
            width: Adaptive.w(100),
            height: 15.h,
            decoration: BoxDecoration(
                color: Constantes.Colorwhite,
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                      color: Constantes.Colorblack.withOpacity(.1),
                      offset: const Offset(3,5),
                      spreadRadius: 2.sp,
                      blurRadius: 1.sp
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _animation,
                      child: Placeholder(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constantes.ColorLight,
                          ),
                          width: Adaptive.w(30),
                          height: 2.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp,),
                    FadeTransition(
                      opacity: _animation,
                      child: Placeholder(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constantes.ColorLight,
                          ),
                          width: Adaptive.w(15),
                          height: 5.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    FadeTransition(
                      opacity: _animation,
                      child: Placeholder(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Constantes.ColorLight,
                              ),
                              width: Adaptive.w(15),
                              height: 0.5.h,
                            ),
                            SizedBox(height: 0.2.h,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Constantes.ColorLight,
                              ),
                              width: Adaptive.w(30),
                              height: 0.5.h,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                FadeTransition(
                  opacity: _animation,
                  child: Placeholder(
                      color: Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: Constantes.ColorLight,
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
