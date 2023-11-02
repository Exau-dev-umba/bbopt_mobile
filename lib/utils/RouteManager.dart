import 'package:bbopt_mobile/models/ChampModel.dart';
import 'package:bbopt_mobile/pages/DonneeMeteo.dart';
import 'package:bbopt_mobile/pages/auth/RegistrationPage.dart';
import 'package:bbopt_mobile/pages/champs/ChampsPage.dart';
import 'package:bbopt_mobile/pages/champs/CreateChampsPage.dart';
import 'package:bbopt_mobile/pages/champs/DetailChampsPage.dart';
import 'package:bbopt_mobile/pages/home/HomePage.dart';
import 'package:bbopt_mobile/pages/auth/LoginPage.dart';
import 'package:bbopt_mobile/pages/welcome/Splashscreen.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:bbopt_mobile/pages/tasks/TasksPage.dart';
import 'package:flutter/material.dart';

import '../pages/analyse/Diagnostique.dart';

class RoutesManager {
  static Route? route(RouteSettings r) {
    switch (r.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_)=> Splashscreen());
      case Routes.champRoute:
        return MaterialPageRoute(builder: (_)=> ChampsPage());
      case Routes.singleChampRoute:
        var args = r.arguments as Map<String, dynamic>?;
        var champData = ChampModel.fromJson(args!);
        return MaterialPageRoute(builder: (_)=> DetailChampsPage(champ: champData));
      case Routes.donneeMeteo:
        return MaterialPageRoute(builder: (_)=>Meteo());
      case Routes.createChampRoute:
        return MaterialPageRoute(builder: (_)=> CreateChampsPage());
      case Routes.loginpage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.registrationpage:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case Routes.taskRoute:
        return MaterialPageRoute(builder: (_) => TasksPage());
      case Routes.diagnostqiue:
        return MaterialPageRoute(builder: (_)=> Diagnostique());
      default:
        return MaterialPageRoute(builder: (_)=> HomePage());
    }
  }
}