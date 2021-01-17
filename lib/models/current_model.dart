import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class CurrentModel with ChangeNotifier {
  final int icon;
  final int feelsLike;
  final String humidity;
  final int windSpeed;
  final String windDir;
  final int updated;
  final int temp;
  final String status;
  final int sunrise;
  final int sunset;

  CurrentModel({
    this.icon,
    this.feelsLike,
    this.humidity,
    this.windSpeed,
    this.windDir,
    this.updated,
    this.temp,
    this.status,
    this.sunrise,
    this.sunset,
  });
}
