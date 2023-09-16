import 'package:bbopt_mobile/controllers/AuthenticationController.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

import '../utils/RouteManager.dart';

class MonApplication extends StatelessWidget{
  GetStorage stockage =GetStorage();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> AuthenticationController(stockage: stockage))
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.route,
            initialRoute: Routes.splashscreen,
          ),
        );
      },
    );
  }
}