import 'package:flutter/material.dart';
import '../models/sensor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SensorsProvider extends ChangeNotifier {
  List<SensorModel> _frTemp = [];

  List<SensorModel> get frTemp {
    return [..._frTemp];
  }

  List<SensorModel> _gdBasement = [];

  List<SensorModel> get gdBasement {
    return [..._gdBasement];
  }

  Future<void> fetchGDStatus(
    String baseName,
    String portName,
    String sensor,
    // String sensorName,
  ) async {
    final url = 'http://$baseName:$portName/house/sensors/$sensor';
    final List<SensorModel> loadGdBasement = [];
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        loadGdBasement.add(
          SensorModel(
            sensor: value[sensor],
            sensorVal: value['sensor_val'],
            date: value['dt'],
          ),
        );
      });
    } catch (error) {
      print(error);
      loadGdBasement.add(
        SensorModel(
          sensor: sensor,
          sensorVal: 25,
          date: 0,
        ),
      );
    }

    _gdBasement = loadGdBasement;
    print(_gdBasement[0].sensorVal);
    notifyListeners();
  }

  Future<void> fetchFRTemp(
    String baseName,
    String portName,
    String sensor,
  ) async {
    final url = 'http://$baseName:$portName/house/sensors/$sensor';
    final List<SensorModel> loadSensor = [];
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        if (value['sensor_val'] > 0) {
          loadSensor.add(
            SensorModel(
              sensor: value[sensor],
              sensorVal: value['sensor_val'],
              date: value['dt'],
            ),
          );
        } else {
          loadSensor.add(
            SensorModel(
              sensor: sensor,
              sensorVal: 25,
              date: value['dt'],
            ),
          );
        }
      });
    } catch (error) {
      print(error);
      loadSensor.add(
        SensorModel(
          sensor: sensor,
          sensorVal: 0,
          date: 0,
        ),
      );
    }

    _frTemp = loadSensor;
    notifyListeners();
  }
}
