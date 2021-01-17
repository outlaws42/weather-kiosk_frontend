import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../helpers/icon_text.dart';
import '../helpers/widget_config.dart';

class Past extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final year = Provider.of<WeatherProvider>(context).year;
    final day = Provider.of<WeatherProvider>(context).day;
    final current = Provider.of<WeatherProvider>(context).current;
    final dateTimeD = DateTime.fromMillisecondsSinceEpoch(year[0].date * 1000);
    final dateTimeY = DateTime.fromMillisecondsSinceEpoch(year[0].date * 1000);
    final sunriseDT =
        DateTime.fromMillisecondsSinceEpoch(current[0].sunrise * 1000);
    final sunsetDT =
        DateTime.fromMillisecondsSinceEpoch(current[0].sunset * 1000);
    final dayCode = day[0].icon;
    final yearCode = year[0].icon;
    final dayImage =
        IconText().getImages(dayCode, dateTimeD, sunriseDT, sunsetDT);
    final yearImage =
        IconText().getImages(yearCode, dateTimeY, sunriseDT, sunsetDT);

    final degSign = '\u00B0';
    return WidgetConfig.contTrans(
      width: 137.5,
      height: 115.0,
      gradColor1: '#232625',
      gradColor2: '#404241',
      opacity: '0xB3',
      marLeft: 20,
      bordRadLB: 20.0,
      bordRadLT: 20.0,
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Yesterday', style: Theme.of(context).textTheme.headline5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${day[0].high.toString() + degSign}/${day[0].low.toString() + degSign}',
                style: Theme.of(context).textTheme.headline5,
              ),
              Image.asset("assets/images/30/$dayImage")
            ],
          ),
          Text('Last Year', style: Theme.of(context).textTheme.headline5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${year[0].high.toString() + degSign}/${year[0].low.toString() + degSign}',
                style: Theme.of(context).textTheme.headline5,
              ),
              Image.asset("assets/images/30/$yearImage")
            ],
          ),
        ],
      ),
    );
  }
}
