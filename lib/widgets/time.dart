import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/weather_provider.dart';
import '../helpers/widget_config.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String _timeString;
  Timer clock;

  @override
  void initState() {
    super.initState();
    clock = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    clock?.cancel();
    super.dispose();
  }

  void _getTime() {
    // 12 hour clock with seconds
    final String formattedDateTime =
        DateFormat.jm().format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      // print(_timeString);
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<WeatherProvider>(context).current;
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(current[0].updated * 1000);
    // var formattedTime = DateFormat.jm().format(DateTime.now());
    final formattedDate = DateFormat.yMMMd().format(dateTime);
    return WidgetConfig.contTrans(
      width: ScreenUtil().setWidth(137.5), //137.5,
      height: ScreenUtil().setHeight(150.0), //115.0,
      gradColor1: '#232625',
      gradColor2: '#404241',
      opacity: '0xB3',
      marRight: 20,
      marTop: 10,
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
              _timeString.toString(),
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
