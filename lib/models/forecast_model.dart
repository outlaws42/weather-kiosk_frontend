import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class ForecastModel with ChangeNotifier {
  final int date;
  final int day0Icon;
  final int day1Icon;
  final int day2Icon;
  final String day0Pop;
  final String day1Pop;
  final String day2Pop;
  final int day0TempLow;
  final int day0TempHigh;
  final int day1TempLow;
  final int day1TempHigh;
  final int day2TempLow;
  final int day2TempHigh;
  final String day0Dow;
  final String day1Dow;
  final String day2Dow;

  ForecastModel({
      this.date,
      this.day0Icon,
      this.day1Icon,
      this.day2Icon,
      this.day0Pop,
      this.day1Pop,
      this.day2Pop,
      this.day0TempLow,
      this.day0TempHigh,
      this.day1TempLow,
      this.day1TempHigh,
      this.day2TempLow,
      this.day2TempHigh,
      this.day0Dow,
      this.day1Dow,
      this.day2Dow
      });
}
