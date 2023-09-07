import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/material.dart';

import '../utils/RouteManager.dart';

class MonApplication extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.route,
      initialRoute: Routes.loginpage,
    );
  }
}