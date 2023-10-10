import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../utils/location_service.dart';

class Meteo extends StatefulWidget {
  @override
  _MeteoState createState() => _MeteoState();
}

class _MeteoState extends State<Meteo> {
  String _iconUrl = '';
  double _temperature = 0.0;
  double? latitude;
  double? longitude;


  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  locatioService() async{
    LocationService locationService = LocationService();
    LocationData? currentLocation = await locationService.getLocation();

    if (currentLocation != null) {
     latitude = currentLocation.latitude;
     longitude = currentLocation.longitude;
    // Faites quelque chose avec les coordonnées de localisation
    } else {
    // Gestion de l'erreur si la localisation n'est pas disponible
    }
  }
  Future<void> _getWeatherData() async {
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

      setState(() {
        _iconUrl = 'https://openweathermap.org/img/w/$icon.png';
        _temperature = temp;
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(_iconUrl),
            SizedBox(height: 16),
            Text('${_temperature.toStringAsFixed(1)}°C'),
          ],
        ),
      ),
    );
  }
}

