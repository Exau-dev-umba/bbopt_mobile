import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Constantes.ColorvertFonce,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Exaucé Umba', style: TextStyle(color: Constantes.Colorblack, fontWeight: FontWeight.bold),),
            accountEmail: Text('umbaexauce233@gmail.com', style: TextStyle(color: Constantes.ColorvertFonce),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Constantes.ColorvertFonce,
              child: ClipOval(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/user.png",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 5,
                        right: 5,
                        child: Icon(Icons.edit, color: Constantes.ColorvertFonce,),

                    )
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Constantes.Colorwhite,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/logos/LOGO AGRIOPT 2K23 COLOR.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.call, color: Constantes.Colorwhite,),
            title: Text('+243 80 90 84 314', style: TextStyle(color: Constantes.Colorwhite),),
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
            leading: Icon(Icons.settings, color: Constantes.Colorwhite,),
            title: Text('Settings', style: TextStyle(color: Constantes.Colorwhite),),
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
            onTap: () => null,
          )
        ],
      ),
    );
  }
}
