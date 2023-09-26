import 'package:bbopt_mobile/controllers/UserController.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();
    });
  }
  @override
  Widget build(BuildContext context) {
    var userCtrl = context.watch<UserCtrl>();
    return Drawer(
      backgroundColor: Constantes.ColorvertFonce,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text('${userCtrl.user?.firstname} ${userCtrl.user?.name}', style: TextStyle(color: Constantes.Colorblack, fontWeight: FontWeight.bold),),
            accountEmail: Text('${userCtrl.user?.email}', style: TextStyle(color: Constantes.ColorvertFonce),),
            // currentAccountPicture: CircleAvatar(
            //   backgroundColor: Constantes.ColorvertFonce,
            //   child: ClipOval(
            //     child: Stack(
            //       children: [
            //         Image.network(
            //           "${Constantes.BASE_URL}/${userCtrl.user?.photo}",
            //           errorBuilder: (BuildContext context, Object exception,
            //               StackTrace? stackTrace) {
            //             return Icon(CupertinoIcons.person_alt_circle, size: 35.sp,);
            //           },
            //           fit: BoxFit.cover,
            //         ),
            //         Positioned(
            //           bottom: 5,
            //             right: 5,
            //             child: Icon(Icons.edit, color: Constantes.ColorvertFonce,),
            //
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: Constantes.Colorwhite,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/logos/LOGO AGRIOPT 2K23 COLOR.png",
                    ),
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.call, color: Constantes.Colorwhite,),
            title: Text('${userCtrl.user?.phone==null? 'Non défini':userCtrl.user?.phone}', style: TextStyle(color: Constantes.Colorwhite),),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(CupertinoIcons.globe, color: Constantes.Colorwhite,),
            title: Text('La langue', style: TextStyle(color: Constantes.Colorwhite),),
            onTap: () => null,
          ),
          Divider( color: Constantes.Colorwhite,),
          ListTile(
            leading: Icon(Icons.notifications, color: Constantes.Colorwhite,),
            title: Text('Notifications', style: TextStyle(color: Constantes.Colorwhite),),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: Adaptive.w(5),
                height: 2.9.h,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.calendar_month, color: Constantes.Colorwhite,),
            title: Text('Calendrier', style: TextStyle(color: Constantes.Colorwhite),),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Constantes.Colorwhite,),
            title: Text('Paramètres', style: TextStyle(color: Constantes.Colorwhite),),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.help, color: Constantes.Colorwhite,),
            title: Text('Obetenir de l\'aide', style: TextStyle(color: Constantes.Colorwhite),),
            onTap: () => null,
          ),
          Divider( color: Constantes.Colorwhite,),
          ListTile(
            title: Text('Editer le profil', style: TextStyle(color: Constantes.Colorwhite),),
            leading: Icon(Icons.edit_note_sharp, color: Constantes.Colorwhite,),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Contactez-nous', style: TextStyle(color: Constantes.Colorwhite),),
            leading: Image.asset(
              "assets/images/call-center-operator_49128.png",
              color: Constantes.Colorwhite,
              width: 22,
            ),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Déconnexion', style: TextStyle(color: Constantes.Colorwhite),),
            leading: Icon(Icons.exit_to_app, color: Constantes.Colorwhite,),
            onTap: () {
              userCtrl.logout();
              Navigator.popAndPushNamed(context, Routes.loginpage);
            },
          )
        ],
      ),
    );
  }
}
