import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class IndoorModel with ChangeNotifier {
  final int front;
  final int date;

  IndoorModel({
    this.front,
    this.date,
  });
}
