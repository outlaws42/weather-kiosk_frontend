import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/main_body.dart';
import '../helpers/widget_config.dart';
import '../helpers/icon_text.dart';

enum FilterOptions {
  Refresh,
  About,
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _isLoading = false;
  Timer timer;

  void checkForAPIUpdates() {
    _isLoading = true;

    Provider.of<SettingProvider>(context, listen: false)
        .fetchSettings()
        .then((_) {
      var setter =
          Provider.of<SettingProvider>(context, listen: false).settings;
      final baseName = setter[0].setting;
      final portName = setter[1].setting;
      Provider.of<WeatherProvider>(context, listen: false).fetchForecast(
        baseName,
        portName,
        setter[3].setting,
      );
      Provider.of<WeatherProvider>(context, listen: false).fetchPast(
        baseName,
        portName,
        setter[4].setting,
        'year',
      );
      Provider.of<WeatherProvider>(context, listen: false).fetchPast(
        baseName,
        portName,
        setter[4].setting,
        'day',
      );
      Provider.of<WeatherProvider>(context, listen: false)
          .fetchCurrent(
        baseName,
        portName,
        setter[2].setting,
      )
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 300), (Timer t) => checkForAPIUpdates());
    checkForAPIUpdates();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<WeatherProvider>(context).current;
    var imageName = 'sunny.jpg';

    if (_isLoading == false) {
      final currentCode = current[0].icon;
      imageName = IconText().getBackground(
        currentCode,
        current[0].sunrise,
        current[0].sunset,
      );
    }
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: WidgetConfig.contImage(
              backImage: imageName,
              context: context,
              child: MainBody(),
            ),
          );
  }
}
