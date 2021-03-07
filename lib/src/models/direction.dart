import 'dart:math';

import 'location.dart';

class Direction {
  Location _startingLocation;
  final Location _targetLocation;
  int _directionAzimuth;

  Direction(
    this._startingLocation,
    this._targetLocation,
  ) {
    this._directionAzimuth = calculateDirectionAzimuth();
  }

  int calculateDirectionAzimuth() {
    double startLat = _toRadians(_startingLocation.latitude);
    double startLong = _toRadians(_startingLocation.longitude);
    double targetLat = _toRadians(_targetLocation.latitude);
    double targetLong = _toRadians(_targetLocation.longitude);
    double diffLong = targetLong - startLong;
    double x = cos(targetLat) * sin(diffLong);
    double y = cos(startLat) * sin(targetLat) -
        sin(startLat) * cos(targetLat) * cos(diffLong);
    double bearing = atan2(x, y);
    double result = _toDegrees(bearing);
    return result.round();
  }

  double _toRadians(double degrees) {
    return pi * degrees / 180;
  }

  double _toDegrees(double radians) {
    return 180 * radians / pi;
  }

  int get directionAzimuth => _directionAzimuth;
}
