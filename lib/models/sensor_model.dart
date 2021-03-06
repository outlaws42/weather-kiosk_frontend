import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class SensorModel with ChangeNotifier {
  final String gdStatus;
  final int date;

  SensorModel({
    this.gdStatus,
    this.date,
  });
}
