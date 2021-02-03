import 'package:flutter/material.dart';
import 'package:weatherkiosk/helpers/db_helper.dart';
import '../models/settings_model.dart';

class SettingProvider extends ChangeNotifier {
  final baseUrl = 'http://192.168.1.3';
  final port = 5000;
  List<SettingsModel> _settings = [];

  List<SettingsModel> get current {
    return [..._settings];
  }

  Future<void> fetchSettings() async {
    final dataList = await DBHelper.getData('settings');
    _settings = dataList
        .map(
          (setting) => SettingsModel(
            id: setting['id'],
            setting: setting['setting'],
            active: setting['active'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
