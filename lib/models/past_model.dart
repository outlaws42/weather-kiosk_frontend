import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class PastModel with ChangeNotifier {
  final int icon;
  final int high;
  final int low;
  final int date;

  PastModel({
    this.icon,
    this.high,
    this.low,
    this.date,
  });
}
