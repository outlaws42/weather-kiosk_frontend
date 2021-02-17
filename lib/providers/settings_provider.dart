import 'package:flutter/material.dart';
import '../helpers/db_helper.dart';
import '../models/settings_model.dart';

class SettingProvider extends ChangeNotifier {
  List<SettingsModel> _settings = [];
  // String _version = '';

  List<SettingsModel> get settings {
    return [..._settings];
  }

  String get version {
    String _version = 'V1.0.3';
    return _version;
  }

  Future<void> fetchSettings() async {
    final dataList = await DBHelper.getData('app_settings');
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

  void addSettings(
    int id,
    String settings,
  ) {
    final newSetting = SettingsModel(
      id: id,
      setting: settings,
      active: 1,
    );
    _settings.add(newSetting);
    notifyListeners();
    DBHelper.insert('app_settings', {
      'id': newSetting.id,
      'setting': newSetting.setting,
      'active': newSetting.active,
    });
  }
}
