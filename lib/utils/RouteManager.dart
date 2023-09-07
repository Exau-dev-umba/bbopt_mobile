import 'package:bbopt_mobile/pages/home/HomePage.dart';
import 'package:bbopt_mobile/pages/auth/LoginPage.dart';
import 'package:bbopt_mobile/pages/welcome/Splashscreen.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static Route? route(RouteSettings r) {
    switch (r.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_)=> Splashscreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_)=> HomePage());
      case Routes.loginpage:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}