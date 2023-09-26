import 'package:location/location.dart';

class LocationService {
  Location location = Location();

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


// LocationService locationService = LocationService();
// LocationData? currentLocation = await locationService.getLocation();
//
// if (currentLocation != null) {
//   double? latitude = currentLocation.latitude;
//   double? longitude = currentLocation.longitude;
//   // Faites quelque chose avec les coordonnées de localisation
// } else {
//   // Gestion de l'erreur si la localisation n'est pas disponible
// }
}
