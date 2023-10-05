import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService extends ChangeNotifier {
  Location location = Location();
  double? latitude;
  double? longitude;

  Future<LocationData?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Gestion de l'erreur si l'utilisateur n'active pas le service de localisation
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Gestion de l'erreur si l'utilisateur refuse la permission de localisation
        return null;
      }
    }

    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      // Gestion de l'erreur lors de la récupération de la localisation
      return null;
    }

    return currentLocation;
  }
  locationService() async{
    LocationService locationService = LocationService();
    LocationData? currentLocation = await locationService.getLocation();

    if (currentLocation != null) {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;
      print("DATA LOCALISATION : ${latitude} - ${longitude}");
    } else {
      throw Exception('Failed to locate service');

    }
  }

}
