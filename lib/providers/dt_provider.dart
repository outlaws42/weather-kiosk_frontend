import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/dt_model.dart';

class DTProvider extends ChangeNotifier {
  List<DTModel> _dateTime = [];

  List<DTModel> get time {
    return [..._dateTime];
  }

  void getDateTime() {
    // 12 hour clock with Date
    final List<DTModel> currentDateTime = [];
    final formattedDate = DateFormat.yMMMd().format(DateTime.now()).toString();
    final String formattedDateTime =
        DateFormat.jm().format(DateTime.now()).toString();
    currentDateTime.add(DTModel(
      time: formattedDateTime,
      date: formattedDate,
    ));

    _dateTime = currentDateTime;
    notifyListeners();
  }
}
