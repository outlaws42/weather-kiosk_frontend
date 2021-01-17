import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class Indoor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final indoor = Provider.of<WeatherProvider>(context).indoor;
    final degSign = '\u00B0';

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(
        '${indoor[0].front.toString() + degSign} | ',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
