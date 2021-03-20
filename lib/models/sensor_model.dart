import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class SensorModel with ChangeNotifier {
  final String sensor;
  final int sensorVal;
  final int date;

  SensorModel({
    this.sensor,
    this.sensorVal,
    this.date,
  });
}
