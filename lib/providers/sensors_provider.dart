import 'package:flutter/material.dart';
import '../models/sensor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SensorsProvider extends ChangeNotifier {
  List<SensorModel> _sensor = [];

  List<SensorModel> get sensors {
    return [..._sensor];
  }

  Future<void> fetchSensors(
    String baseName,
    String portName,
    // String sensorName,
  ) async {
    final url = 'http://$baseName:$portName/house/sensors';
    final List<SensorModel> loadSensor = [];
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        loadSensor.add(
          SensorModel(
            gdStatus: value['gdbasement'],
            date: value['dt'],
          ),
        );
      });
    } catch (error) {
      loadSensor.add(
        SensorModel(
          gdStatus: 'NS',
          date: 0,
        ),
      );
    }

    _sensor = loadSensor;
    notifyListeners();
  }
}
