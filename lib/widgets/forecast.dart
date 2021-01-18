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
    final current = Provider.of<WeatherProvider>(context).current;

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
                current[0].updated,
                current[0].sunrise,
                current[0].sunset,
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
