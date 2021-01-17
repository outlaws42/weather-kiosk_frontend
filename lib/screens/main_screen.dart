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
  int starter = 0;
  Timer timer;

  void checkForNewSharedLists() {
    print('Updated every 60');
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
        Duration(seconds: 60), (Timer t) => checkForNewSharedLists());
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
      final dateTime =
          DateTime.fromMillisecondsSinceEpoch(current[0].updated * 1000);
      final sunriseDT =
          DateTime.fromMillisecondsSinceEpoch(current[0].sunrise * 1000);
      final sunsetDT =
          DateTime.fromMillisecondsSinceEpoch(current[0].sunset * 1000);
      imageName =
          IconText().getBackground(currentCode, dateTime, sunriseDT, sunsetDT);
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
