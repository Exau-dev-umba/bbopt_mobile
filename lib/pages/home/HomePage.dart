import 'package:bbopt_mobile/pages/avis/AvisPage.dart';
import 'package:bbopt_mobile/pages/communaute/CommunautePage.dart';
import 'package:bbopt_mobile/pages/discuter/DiscuterPage.dart';
import 'package:bbopt_mobile/pages/home/AccueilPagePage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../analyse/AnalysePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final pages= [
    AccueilPagePage(),
    AnalysePage(),
    CommunautePage(),
    DiscuterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _bottomNav(){
    return BottomNavigationBar(
      backgroundColor: Constantes.ColorvertFonce,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Constantes.Colorwhite,
      selectedItemColor: Constantes.Colorjaune,
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
      selectedLabelStyle: TextStyle(fontSize: 13.sp),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/nav/home.png', width:_currentIndex==0? Adaptive.w(8):Adaptive.w(7), color:_currentIndex==0?Constantes.Colorjaune:Constantes.Colorwhite),
          label: 'ACCUEIL',
        ),
        // BottomNavigationBarItem(
        //   icon: Image.asset('assets/nav/photo-camera.png', width: _currentIndex==1? Adaptive.w(8):Adaptive.w(7), color:_currentIndex==1?Constantes.Colorjaune:Constantes.Colorwhite),
        //   label:'DIAGNOSTIQUER'
        // ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nav/photo-camera.png', width: _currentIndex==1? Adaptive.w(8):Adaptive.w(7), color:_currentIndex==1?Constantes.Colorjaune:Constantes.Colorwhite),
            label:'ANALYSE'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nav/group.png', width: _currentIndex==2? Adaptive.w(8):Adaptive.w(7), color:_currentIndex==2?Constantes.Colorjaune:Constantes.Colorwhite),
            label:'COMMUNAUTE'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nav/chat.png', width: _currentIndex==3? Adaptive.w(8):Adaptive.w(7), color:_currentIndex==3?Constantes.Colorjaune:Constantes.Colorwhite),
            label:'MESSAGE'
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
