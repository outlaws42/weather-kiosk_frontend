import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'indoor.dart';
import '../screens/settings.dart';
import '../providers/weather_provider.dart';
import '../helpers/widget_config.dart';
import '../helpers/icon_text.dart';

class Current extends StatelessWidget {
  void selectSettings(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Settings.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<WeatherProvider>(context).current;
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(current[0].updated * 1000);
    final formattedTime = DateFormat('hh:mm a').format(dateTime);
    final degSign = '\u00B0';
    final refresh = '\u21BB';
    final iconCode = current[0].icon;

    final imageName = IconText().getImages(
      iconCode,
      current[0].updated,
      current[0].sunrise,
      current[0].sunset,
    );

    return WidgetConfig.contTrans(
      height: ScreenUtil().setHeight(215.0), //215.0,
      width: ScreenUtil().setWidth(285.0), //285.0,
      marLeft: 0,
      marTop: 10,
      borderRad: 20.0,
      gradColor1: '#404241',
      gradColor2: '#232625',
      opacity: '0xB3',
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/30/wind.png"),
                Text(
                  '${current[0].windDir.toString()} at ${current[0].windSpeed.toString()}MPH',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Indoor(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  child: Text(
                    '${current[0].temp.toString() + degSign}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Image.asset("assets/images/65/$imageName"),
                    iconSize: 65,
                    onPressed: () {
                      selectSettings(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 105,
                child: Text(
                  'Feels: ${current[0].feelsLike.toString() + degSign}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Container(
                width: 65,
                child: Text(
                  '${current[0].status.toString()}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
          Container(
            child: Text(
              'Humidity: ${current[0].humidity}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            child: Text(
              '${refresh + formattedTime}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
