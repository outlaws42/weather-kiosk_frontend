import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
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
    Provider.of<WeatherProvider>(context, listen: false).fetchForecast();
    Provider.of<WeatherProvider>(context, listen: false).fetchPast('year');
    Provider.of<WeatherProvider>(context, listen: false).fetchPast('day');
    Provider.of<WeatherProvider>(context, listen: false).fetchIndoor();
    Provider.of<WeatherProvider>(context, listen: false)
        .fetchCurrent()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    timer = Timer.periodic(
        Duration(seconds: 30), (Timer t) => checkForAPIUpdates());
    _isLoading = true;
    Provider.of<WeatherProvider>(context, listen: false).fetchForecast();
    Provider.of<WeatherProvider>(context, listen: false).fetchPast('year');
    Provider.of<WeatherProvider>(context, listen: false).fetchPast('day');
    Provider.of<WeatherProvider>(context, listen: false).fetchIndoor();
    Provider.of<WeatherProvider>(context, listen: false)
        .fetchCurrent()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<WeatherProvider>(context).current;
    var imageName = 'sunny.jpg';

    if (_isLoading == false) {
      final currentCode = current[0].icon;
      imageName = IconText().getBackground(
        currentCode,
        current[0].updated,
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
