import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../models/UserModel.dart';
import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class UserCtrl with ChangeNotifier {
  UserModel? user;
  bool loading = false;
  GetStorage? stockage;
  bool _isFirstTimeBienvenue=false;
  bool get isFirstTimeBienvenue {
    return stockage?.read<bool>(StockageKeys.is_first_time) ?? _isFirstTimeBienvenue;
  }

  set isFirstTimeBienvenue(bool value) {
    _isFirstTimeBienvenue = value;
    stockage?.write(StockageKeys.is_first_time, value);
  }

  UserCtrl({this.stockage});

  void recuperDataAPI() async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.infosUser;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      user= UserModel.fromJson(reponse);
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  /*Future<HttpResponse> updateUser(Map data, String userId) async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.updateInfosUsers.replaceAll("{user}", userId);
    loading = true;
    notifyListeners();
    HttpResponse response = await postData(url, data, token: token);
    if(response.status){
      user=UserModel.fromJson(response.data?['user'] ?? {});
      stockage?.write(StockageKeys.token, response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    return response;
  }

  void updateImageProfil(data, userId) async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.updateImageUser.replaceAll("{user}", userId);
    loading = true;
    notifyListeners();
    var reponse = await postData(url,data,token: token);
    if(reponse!=null){
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }*/
}
