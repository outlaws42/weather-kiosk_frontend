import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../providers/settings_provider.dart';

class Indoor extends StatefulWidget {
  @override
  _IndoorState createState() => _IndoorState();
}

class _IndoorState extends State<Indoor> {
  Timer time;

  void checkForAPIUpdates() {
    // _isLoading = true;

    Provider.of<SettingProvider>(context, listen: false)
        .fetchSettings()
        .then((_) {
      var setter =
          Provider.of<SettingProvider>(context, listen: false).settings;
      final baseName = setter[0].setting;
      final portName = setter[1].setting;
      Provider.of<WeatherProvider>(context, listen: false).fetchIndoor(
        baseName,
        portName,
        setter[5].setting,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    time = Timer.periodic(
        Duration(seconds: 45), (Timer t) => checkForAPIUpdates());
    checkForAPIUpdates();
  }

  @override
  void dispose() {
    time?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final indoor = Provider.of<WeatherProvider>(context).indoor;
    final degSign = '\u00B0';

    return Consumer<WeatherProvider>(
      child: Text('NA'),
      builder: (ctx, payload, ch) => payload.indoor.length == 0
          ? ch
          : Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.center,
              child: Text(
                '${payload.indoor[0].front.toString() + degSign} | ',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
    );
  }
}
