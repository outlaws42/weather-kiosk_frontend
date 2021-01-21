import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final dayCode = day[0].icon;
    final yearCode = year[0].icon;

    final dayImage = IconText().getImages(
      dayCode,
      current[0].updated,
      current[0].sunrise,
      current[0].sunset,
    );

    final yearImage = IconText().getImages(
      yearCode,
      current[0].updated,
      current[0].sunrise,
      current[0].sunset,
    );

    final degSign = '\u00B0';
    return WidgetConfig.contTrans(
      width: ScreenUtil().setWidth(137.5), //137.5,
      height: ScreenUtil().setHeight(150.0), //115.0,
      gradColor1: '#232625',
      gradColor2: '#404241',
      opacity: '0xB3',
      marLeft: 20,
      marTop: 10,
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
          SizedBox(
            height: 10,
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
