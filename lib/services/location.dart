import 'package:geolocator/geolocator.dart';

class Location {
  double cLatitude, cLongitude;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    cLatitude = position.latitude;
    cLongitude = position.longitude;
  }
}
