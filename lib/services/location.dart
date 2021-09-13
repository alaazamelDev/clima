import 'package:geolocator/geolocator.dart';

class Location {
  late double _longitude;
  late double _latitude;

  double get longitude => _longitude;
  double get latitude => _latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      //assign the fetched location to lon & lat properties
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (ex) {
      print('can\'t catch');
    }
  }
}
