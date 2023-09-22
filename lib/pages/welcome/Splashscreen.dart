import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:bbopt_mobile/utils/StockageKeys.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  GetStorage? stockage;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var tkn = stockage?.read(StockageKeys.token);
      Future.delayed(Duration(seconds: 2), (){
        tkn!=null?
        Navigator.popAndPushNamed(context, Routes.loginpage):
        Navigator.popAndPushNamed(context, Routes.homeRoute);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Constantes.ColorvertFonce,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logos/LOGO AGRIOPT 2K23.png'),
                SizedBox(
                  height: 20.sp,
                  child: Text("Powered by bilanga best optimal", style: TextStyle(color: Constantes.Colorwhite),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
