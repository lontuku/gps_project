import 'dart:async';

import 'package:gps_project/datamodels/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  //keep track of curren location
  UserLocation _currentLocation;
  Location location = Location();

  //continuamente emite la ubicación
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.GRANTED) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('No es posible obtener la ubicación: $e');
    }

    return _currentLocation;
  }
}
