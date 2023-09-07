import 'package:bbopt_mobile/pages/avis/AvisPage.dart';
import 'package:bbopt_mobile/pages/calendrier/CalendrierPage.dart';
import 'package:bbopt_mobile/pages/communaute/CommunautePage.dart';
import 'package:bbopt_mobile/pages/diagnostique/DiagnostiquePage.dart';
import 'package:bbopt_mobile/pages/discuter/DiscuterPage.dart';
import 'package:bbopt_mobile/pages/stat/StatPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late Color other;
  final pages= [
    DiscuterPage(),
    CalendrierPage(),
    DiagnostiquePage(),
    StatPage(),
    AvisPage(),
    CommunautePage()
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
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/nav/chatbot.png', width: 25,),
          label: 'DISCUTER',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/nav/calendar.png', width: 25,),
          label: 'CALENDRIER',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/nav/photo-camera.png', width: 25,),
          label:'DIAGNOSTIQUER'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nav/trend.png', width: 25,),
            label:'STATISTIQUE'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nav/message.png', width: 25,),
            label:'LES AVIS'
        ),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nav/group.png', width: 25,),
            label:'LA COMMUNAUTE'
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
