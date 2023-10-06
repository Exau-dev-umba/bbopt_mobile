import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MeteoController extends ChangeNotifier{
  String iconUrl = '';
  double temperature = 0.0;

  Future<double> getWeatherData({latitude, longitude}) async {
    final apiKey = '4b9de1a0093ef466c31131959bc82195';
    // final latitude = 37.7749;
    // final longitude = -122.4194;
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final weather = data['weather'][0];
      final main = data['main'];
      final icon = weather['icon'];
      final temp = main['temp'];
      iconUrl = 'https://openweathermap.org/img/w/$icon.png';
      temperature = temp;
    } else {
      throw Exception('Failed to load weather data');
    }

    return temperature;
  }



}