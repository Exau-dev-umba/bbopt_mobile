import 'package:bbopt_mobile/models/CommunauteModel.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class CommunauteController extends ChangeNotifier{
  List<CommunauteModel>? posts;
  int? nbrChamp;
  GetStorage? stockage;
  bool loading = false;
  CommunauteController({this.stockage});


  void recuperPostsAPI() async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.posts;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      posts= reponse['posts']
          .map<CommunauteModel>((e) => CommunauteModel.fromJson(e))
          .toList();
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}

void main(){
  var test = CommunauteController();
  test.recuperPostsAPI();
}