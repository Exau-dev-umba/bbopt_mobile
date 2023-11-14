import 'package:bbopt_mobile/controllers/UserController.dart';
import 'package:bbopt_mobile/pages/auth/LoginPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:bbopt_mobile/utils/StockageKeys.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

import '../../controllers/ChampController.dart';
import '../../controllers/MeteoController.dart';
import '../../controllers/TacheController.dart';
import '../../utils/location_service.dart';
import '../home/HomePage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  GetStorage stockage = GetStorage();
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var location = context.read<LocationService>();
      location.locationService();
      var champCtrl = context.read<ChampController>();
      var tacheCtrl = context.read<TacheController>();
      var meteo = context.read<MeteoController>();
      location.locationService();
      meteo.getWeatherData(latitude: "-4.44193110", longitude: "15.26629310");
      champCtrl.recuperNbreChampsAPI();
      champCtrl.recuperChampAPI();
      tacheCtrl.recuperNbreTacheAPI();
      tacheCtrl.recuperTachesAPI();
      champCtrl.recuperNbrCulture();
      var userCtrl = context.read<UserCtrl>();
      var tkn = stockage.read(StockageKeys.token);
      Future.delayed(const Duration(milliseconds: 1)).then((value) => setState(() {
        isLoaded = true;
        tkn==null?null:userCtrl.recuperDataAPI();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    var tkn = stockage.read(StockageKeys.token);
    return SplashScreenView(
      // speed: Duration(microseconds: 1),
      duration: Duration(microseconds: 1),
      displayLoading: false,
      navigateWhere: isLoaded,
      navigateRoute: tkn==null?LoginPage(): HomePage(),
      backgroundColor: Constantes.ColorvertFonce,
      text: WavyAnimatedText(
        "Best Bilanga Optimal",
        speed: Duration(microseconds: 1),
        textStyle: const TextStyle(
          color: Constantes.Colorwhite,
          fontSize: 12,
        ),
      ),
      imageSrc: "assets/logos/LOGO AGRIOPT 2K23.png",
      logoSize: 70.sp,
    );
  }
  }
