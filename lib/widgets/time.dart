import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/weather_provider.dart';
import '../helpers/widget_config.dart';

class Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<WeatherProvider>(context).current;
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(current[0].updated * 1000);
    var formattedTime = DateFormat.jm().format(DateTime.now());
    final formattedDate = DateFormat.yMMMd().format(dateTime);
    return WidgetConfig.contTrans(
      width: 137.5,
      height: 115.0,
      gradColor1: '#232625',
      gradColor2: '#404241',
      opacity: '0xB3',
      marRight: 20,
      bordRadRB: 20.0,
      bordRadRT: 20.0,
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(
              '$formattedTime',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(
              '$formattedDate',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
