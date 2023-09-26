import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/AuthenticationModel.dart';
import '../utils/Constantes.dart';
import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class AuthenticationController with ChangeNotifier {

  AuthenticationController({this.stockage});

  String? token;
  AuthenticationModel? user;
  GetStorage? stockage;

  List<AuthenticationModel> auth = [];
  bool loading = false;

  Future<HttpResponse> logout(Map data) async{
    var url="${Endpoints.logout}";
    var tkn = stockage?.read(StockageKeys.token);
    HttpResponse response = await postData(url, data, token: tkn);
    if(response.status){
      notifyListeners();
    }
    print(response.data);
    return response;
  }

  Future<HttpResponse>login(Map data) async{
    var url="${Endpoints.login}";
    HttpResponse response = await postData(url, data);
    if(response.status){
      user=AuthenticationModel.fromJson(response.data?['user'] ?? {});
      stockage?.write(StockageKeys.token, response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    return response;
  }

  Future<HttpResponse> register(Map data) async{
    var url = "${Endpoints.register}";
    HttpResponse response = await postData(url, data);
    if (response!=null){
      stockage?.write(StockageKeys.token, response.data?["token"]) ;
      notifyListeners();
    }
    return response;
  }

  void recuperDataAPI() async{
    var url=Uri.parse("${Constantes.BASE_URL}${Endpoints.infosUser}");
    loading=true;
    notifyListeners();
    var reponse= await http.get(url);
    print(reponse.runtimeType);
    print(reponse.body.runtimeType);
    print(reponse.body);
    print(reponse.statusCode);
    loading=false;
    notifyListeners();
  }
}
