import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/Constantes.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> notifications = [
    "Vous avez un nouveau message",
    "Pierro vous suivi maintenant",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/LOGO AGRIOPT 2K23.png',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 0.4,
            )
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(18.sp),
          )
        ],
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.all(15),
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.notifications, color: Constantes.ColorvertFonce,),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              notifications[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              "Il y a quelques minutes",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(child: Icon(Icons.more_horiz), onTap: (){},),
                    ],
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey[400],)
            ],
          );
        },
      ),
    );
  }
}
