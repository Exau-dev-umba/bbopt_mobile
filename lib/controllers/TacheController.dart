import 'package:bbopt_mobile/models/TacheModel.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class TacheController extends ChangeNotifier{
  List<TacheModel>? taches;
  int? nbrtache;
  GetStorage? stockage;
  bool loading = false;
  TacheController({this.stockage});

  void recuperTachesAPI() async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.taches;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      taches= reponse['tasks']
          .map<TacheModel>((e) => TacheModel.fromJson(e))
          .toList();
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  void recuperNbreTacheAPI() async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.nbreTaches;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      nbrtache= reponse['count'];
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}