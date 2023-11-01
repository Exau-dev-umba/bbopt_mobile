import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/Requests.dart';

class RecommandationController extends ChangeNotifier{
  GetStorage? stockage;
  String? data;
  bool loading = false;
  RecommandationController({this.stockage});


  void getRecommandationCulture(
      {
        required Map data,
      }
      ) async {
    try{
      var url = 'culture/';
      var reponse = await postDataCulture(url, data);
      loading = true;
      notifyListeners();

      if (reponse.status) {
      } else {
      }
    }catch(e, trace) {
      printWrapped(e.toString());
      printWrapped(trace.toString());
    }
  }


}
void main() {

  var test = RecommandationController();
  test.getRecommandationCulture(
      data: {
        "nitrogen":5,
        "phosphorus" : 16,
        "potassium" : 3,
        "temperature": 50,
        "humidity": 56,
        "rainfall": 2,
        "ph": 14
  });
}
