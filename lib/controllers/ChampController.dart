import 'package:bbopt_mobile/models/ChampModel.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class ChampController extends ChangeNotifier{
  List<ChampModel>? champ;
  int? nbrChamp;
  GetStorage? stockage;
  bool loading = false;
  ChampController({this.stockage});


  void recuperChampAPI() async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.champs;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      champ= reponse['champs']
          .map<ChampModel>((e) => ChampModel.fromJson(e))
          .toList();
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  void recuperSingleChampAPI(id) async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.signleChamps.replaceAll("{id}", id);
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      champ= reponse['champs']
          .map<ChampModel>((e) => ChampModel.fromJson(e))
          .toList();
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  void createChampAPI(Map data) async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.champs;
    loading = true;
    notifyListeners();
    var reponse = await postData(url,data, token: token);
    if(reponse!=null){
    }
    loading = false;
    notifyListeners();
  }

  void recuperNbreChampsAPI() async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.nbreChamps;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      nbrChamp= reponse['count'];
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}