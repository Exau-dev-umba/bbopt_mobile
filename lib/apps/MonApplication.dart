import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

import '../utils/RouteManager.dart';

class MonApplication extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.route,
          initialRoute: Routes.splashscreen,
        );
      },
    );
  }
}