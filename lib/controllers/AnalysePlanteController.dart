import 'dart:io';

import 'package:bbopt_mobile/utils/Constantes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart ' as http;
import '../utils/Endpoints.dart';
import '../utils/Requests.dart';

class AnalysePlanteController extends ChangeNotifier{
  GetStorage? stockage;
  String? data;
  bool loading = false;
  AnalysePlanteController({this.stockage});


  void diagnostic( plant, image) async {
    var url =Endpoints.posts;
    loading = true;
    notifyListeners();
    var reponse = await postData(url, image);
    if(reponse!=null){

    }
    loading = false;
    notifyListeners();
  }

  // Méthode pour envoyer l'image à l'API REST
  void sendImageToApi({File? imageFile, plant}) async {
    try{
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Constantes.DIAGNOSTIC_URL}$plant/'),
      );
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.files.add(
        http.MultipartFile(
          'image',
          imageFile!.readAsBytes().asStream(),
          imageFile.lengthSync(),
          filename: imageFile.path.split('/').last,
        ),
      );

      var res = await request.send();
      http.Response response = await http.Response.fromStream(res);
      // data = jsonDecode(response.body);

      print("request: " + request.toString());
      print("Response : ${response.body}");
      request.headers.addAll(headers);

      data = response.body;

      // Vérifier le code de statut de la réponse
      if (response.statusCode == 200) {
        print('Image envoyée avec succès');
      } else {
        print(
            'Échec de l\'envoi de l\'image. Code de statut : ${response.statusCode}');
      }
    }catch(e, trace) {
      printWrapped(e.toString());
      printWrapped(trace.toString());
    }
  }


}
