import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './current.dart';
import '../providers/weather_provider.dart';
import './past.dart';
import 'dt.dart';
import './forecast.dart';

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    final forecast = Provider.of<WeatherProvider>(context).forecast;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Past(),
            Current(),
            DT(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Forecast(
              day: forecast[0].day0Dow,
              pop: forecast[0].day0Pop,
              icon: forecast[0].day0Icon,
              tempHigh: forecast[0].day0TempHigh,
              tempLow: forecast[0].day0TempLow,
            ),
            Forecast(
              day: forecast[0].day1Dow,
              pop: forecast[0].day1Pop,
              icon: forecast[0].day1Icon,
              tempHigh: forecast[0].day1TempHigh,
              tempLow: forecast[0].day1TempLow,
            ),
            Forecast(
              day: forecast[0].day2Dow,
              pop: forecast[0].day2Pop,
              icon: forecast[0].day2Icon,
              tempHigh: forecast[0].day2TempHigh,
              tempLow: forecast[0].day2TempLow,
            ),
          ],
        ),
      ],
    );
  }
}
