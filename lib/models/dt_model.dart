import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class DTModel with ChangeNotifier {
  final String time;
  final String date;

  DTModel({
    this.time,
    this.date,
  });
}
