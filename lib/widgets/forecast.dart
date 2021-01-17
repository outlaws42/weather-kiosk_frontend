import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../helpers/icon_text.dart';
import '../helpers/widget_config.dart';

class Forecast extends StatelessWidget {
  final String day;
  final String pop;
  final int icon;
  final String temp;

  Forecast({
    this.day,
    this.pop,
    this.icon,
    this.temp,
  });

  @override
  Widget build(BuildContext context) {
    final forecast = Provider.of<WeatherProvider>(context).forecast;
    final current = Provider.of<WeatherProvider>(context).current;
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(forecast[0].date * 1000);
    final sunriseDT =
        DateTime.fromMillisecondsSinceEpoch(current[0].sunrise * 1000);
    final sunsetDT =
        DateTime.fromMillisecondsSinceEpoch(current[0].sunset * 1000);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WidgetConfig.contTrans(
          width: 150.0,
          height: 125.0,
          marLeft: 2,
          marRight: 5,
          marTop: 10,
          borderRad: 8.0,
          gradColor1: '#404241',
          gradColor2: '#232625',
          opacity: '0xB3',
          context: context,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    pop,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Image.asset("assets/images/65/${IconText().getImages(
                icon,
                dateTime,
                sunriseDT,
                sunsetDT,
              )}"),
              Text(
                temp,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
