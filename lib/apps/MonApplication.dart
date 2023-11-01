import 'package:bbopt_mobile/controllers/AnalysePlanteController.dart';
import 'package:bbopt_mobile/controllers/AuthenticationController.dart';
import 'package:bbopt_mobile/controllers/ChampController.dart';
import 'package:bbopt_mobile/controllers/MeteoController.dart';
import 'package:bbopt_mobile/controllers/TacheController.dart';
import 'package:bbopt_mobile/controllers/UserController.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:bbopt_mobile/utils/location_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/services.dart';
import '../utils/RouteManager.dart';

class MonApplication extends StatelessWidget{
  GetStorage stockage =GetStorage();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> AuthenticationController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> UserCtrl(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> ChampController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> TacheController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> AnalysePlanteController(stockage: stockage)),
            ChangeNotifierProvider(create: (_)=> MeteoController()),
            ChangeNotifierProvider(create: (_)=> LocationService()),
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