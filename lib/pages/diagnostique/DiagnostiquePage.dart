import 'package:bbopt_mobile/pages/user/ProfilPage.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiagnostiquePage extends StatefulWidget {
  const DiagnostiquePage({Key? key}) : super(key: key);

  @override
  State<DiagnostiquePage> createState() => _DiagnostiquePageState();
}

class _DiagnostiquePageState extends State<DiagnostiquePage> {
  WebViewController controller = WebViewController()
  ..loadRequest(Uri.parse("https://pub.dev"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilPage(),
      appBar: AppBar(
        title: Text('DIAGNOSTIQUER', style: TextStyle(color: Constantes.Colorjaune),),
        centerTitle: true,
        backgroundColor: Constantes.ColorvertFonce,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            webViewDiagnostiquer()
          ],
        ),
      )
    );
  }
  
  webViewDiagnostiquer(){
    return WebViewWidget(
      controller: controller,
    );
  }
}
